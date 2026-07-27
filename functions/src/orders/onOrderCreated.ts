import { onDocumentCreated } from "firebase-functions/v2/firestore";
import { FieldValue, Timestamp } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { notifyAdmins } from "../lib/fcm";
import { Paths, ActivityType, Roles, Tiers } from "../lib/constants";
import { computeDoctorTierInfo, TIER_LABELS } from "../lib/tiers";

interface OrderItem {
  productId: string;
  productName: string;
  variantId: string;
  variantLabel: string;
  unitSellPrice: number;
  quantity: number;
  lineTotal: number;
  offerId?: string;
  offerName?: string;
}

/**
 * Fires once per newly created order. Reconciles everything the client
 * intentionally does NOT compute itself (stock, profit snapshot, stats,
 * notifications) via FieldValue.increment, so two admin sessions creating
 * orders concurrently never race each other.
 *
 * IMPORTANT: profit is deliberately NOT added to stats/global or
 * stats/monthlyProfit here — the confirmed business rule is "profit counts
 * at order completion", handled entirely in onOrderUpdated.ts. This
 * function only freezes the profit snapshot (profitData/summary) so it's
 * ready to apply later, and updates order *count* stats, which do count
 * at creation time.
 */
export const onOrderCreated = onDocumentCreated(
  `${Paths.orders}/{orderId}`,
  async (event) => {
    const snap = event.data;
    if (!snap) return;
    const order = snap.data();
    const orderId = event.params.orderId;
    const items: OrderItem[] = order.items ?? [];

    // 1. Decrement stock per line item, increment totalSold.
    await Promise.all(
      items.map((item) =>
        db
          .collection(Paths.products)
          .doc(item.productId)
          .collection(Paths.variants)
          .doc(item.variantId)
          .update({
            quantity: FieldValue.increment(-item.quantity),
            totalSold: FieldValue.increment(item.quantity),
            updatedAt: FieldValue.serverTimestamp(),
          })
      )
    );

    // 1.5. Package (offer) sales analytics. Items carrying the same
    // offerId came from one Offer purchase — reread the offer's definition
    // to work out how many packages this represents (orderedQuantity /
    // the package's own defined item quantity) and how much discount that
    // implies, rather than trusting anything client-supplied.
    const offerGroups = new Map<string, OrderItem[]>();
    for (const item of items) {
      if (!item.offerId) continue;
      const group = offerGroups.get(item.offerId) ?? [];
      group.push(item);
      offerGroups.set(item.offerId, group);
    }
    await Promise.all(
      Array.from(offerGroups.entries()).map(async ([offerId, group]) => {
        const offerRef = db.collection(Paths.offers).doc(offerId);
        const offerSnap = await offerRef.get();
        if (!offerSnap.exists) return;
        const offerData = offerSnap.data() as {
          items?: { unitPrice: number; quantity: number }[];
          offerPrice?: number;
        };
        const offerItems = offerData.items ?? [];
        const definedQuantity = offerItems.reduce((s, i) => s + i.quantity, 0);
        const originalTotal = offerItems.reduce(
          (s, i) => s + i.unitPrice * i.quantity,
          0
        );
        const orderedQuantity = group.reduce((s, i) => s + i.quantity, 0);
        const packagesPurchased =
          definedQuantity > 0 ? Math.round(orderedQuantity / definedQuantity) : 1;
        const revenue = group.reduce((s, i) => s + i.lineTotal, 0);
        const discountGiven = Math.max(
          0,
          packagesPurchased * (originalTotal - (offerData.offerPrice ?? 0))
        );
        await offerRef.update({
          timesSold: FieldValue.increment(1),
          unitsSold: FieldValue.increment(packagesPurchased),
          totalRevenue: FieldValue.increment(revenue),
          totalDiscountGiven: FieldValue.increment(discountGiven),
        });
      })
    );

    // 2. Freeze the cost/profit snapshot from the admin-only costs path —
    // this is the only point in time cost data is read for this order, so
    // later cost-price edits never retroactively change a placed order.
    const costDocs = await Promise.all(
      items.map((item) =>
        db
          .collection(Paths.products)
          .doc(item.productId)
          .collection(Paths.costs)
          .doc(item.variantId)
          .get()
      )
    );
    // A loyalty-tier discount (if any) reduces what the doctor actually
    // pays without reducing item.lineTotal (which stays the full catalog
    // price for stock/offer-analytics purposes) — so profit must be scaled
    // down by the same rate here, or it would overstate real margin.
    const discountRate = (order.discountRate as number) ?? 0;
    let totalCost = 0;
    let totalProfit = 0;
    const profitItems = items.map((item, i) => {
      const unitCostPrice = (costDocs[i].data()?.costPrice as number) ?? 0;
      const lineCost = unitCostPrice * item.quantity;
      const lineProfit = item.lineTotal * (1 - discountRate) - lineCost;
      totalCost += lineCost;
      totalProfit += lineProfit;
      return { variantId: item.variantId, unitCostPrice, lineProfit };
    });
    await db
      .collection(Paths.orders)
      .doc(orderId)
      .collection(Paths.profitData)
      .doc(Paths.profitDataSummaryDoc)
      .set({ items: profitItems, totalCost, totalProfit });

    // 3. Order *count* stats — counted at creation, unlike profit. The
    // order's full amount also enters outstanding debt here (it starts
    // fully unpaid at the instant this doc is created); onPaymentCreated
    // decrements it back down as payments land, including any same-flow
    // payment recorded immediately after order creation.
    await db
      .collection(Paths.stats)
      .doc(Paths.statsGlobalDoc)
      .set(
        {
          totalOrdersAllTime: FieldValue.increment(1),
          totalOrdersThisMonth: FieldValue.increment(1),
          totalOutstandingDebt: FieldValue.increment(order.totalAmount ?? 0),
        },
        { merge: true }
      );

    // 4. Doctor's own denormalized stats.
    await db
      .collection(Paths.users)
      .doc(order.doctorId)
      .set(
        {
          stats: {
            totalOrders: FieldValue.increment(1),
            totalSpent: FieldValue.increment(order.totalAmount ?? 0),
            totalDebt: FieldValue.increment(order.totalAmount ?? 0),
            lastOrderAt: FieldValue.serverTimestamp(),
          },
        },
        { merge: true }
      );
    // NOTE: totalDebt is incremented by the FULL order total here (an order
    // starts as fully unpaid before any same-transaction payment write
    // lands) and then reconciled downward by onPaymentCreated as payments
    // come in — see that trigger for the corresponding decrement.

    // 4.5. Loyalty-tier bookkeeping. The tier itself is never stored — only
    // a detection cursor (lastSeenTier/lastSeenTierYear) so we can tell "the
    // doctor upgraded within this year" (log it) apart from "a new calendar
    // year silently reset everyone to silver" (don't log it as a downgrade).
    // Re-queries this doctor's orders for the year (now including the one
    // that just triggered this function) rather than trusting any
    // denormalized field, per the same "always recompute" rule the client
    // follows.
    {
      const yearStart = Timestamp.fromDate(
        new Date(Date.UTC(new Date().getUTCFullYear(), 0, 1))
      );
      const [ordersThisYearSnap, doctorSnap] = await Promise.all([
        db
          .collection(Paths.orders)
          .where("doctorId", "==", order.doctorId)
          .where("createdAt", ">=", yearStart)
          .get(),
        db.collection(Paths.users).doc(order.doctorId).get(),
      ]);
      const tierInfo = computeDoctorTierInfo(
        ordersThisYearSnap.docs.map((d) => d.data())
      );
      const lastSeenTier = (doctorSnap.data()?.lastSeenTier as string) ?? Tiers.silver;
      const lastSeenTierYear = (doctorSnap.data()?.lastSeenTierYear as number) ?? 0;

      if (tierInfo.year !== lastSeenTierYear) {
        // First time we've computed a tier for this doctor this year —
        // silent reset, not a downgrade worth logging.
        await db.collection(Paths.users).doc(order.doctorId).set(
          { lastSeenTier: tierInfo.tier, lastSeenTierYear: tierInfo.year },
          { merge: true }
        );
      } else if (tierInfo.tier !== lastSeenTier) {
        await db.collection(Paths.users).doc(order.doctorId).set(
          { lastSeenTier: tierInfo.tier },
          { merge: true }
        );
        await db.collection(Paths.activityLog).add({
          type: ActivityType.tierUpgraded,
          actorUid: order.doctorId,
          actorName: order.doctorNameSnapshot,
          actorRole: Roles.doctor,
          message: `🎉 د. ${order.doctorNameSnapshot} ترقّى إلى المستوى ${TIER_LABELS[tierInfo.tier]} لعام ${tierInfo.year}`,
          relatedOrderId: orderId,
          createdAt: FieldValue.serverTimestamp(),
        });
      }
    }

    // 5. Activity log — always logged; push notification only when the
    // *doctor* is the one who placed the order (admin already knows about
    // orders they just entered themselves).
    const itemsSummary = items
      .map((i) => `${i.productName} (${i.variantLabel}) x${i.quantity}`)
      .join("، ");
    await db.collection(Paths.activityLog).add({
      type: ActivityType.orderCreated,
      actorUid: order.createdByUid,
      actorName: order.doctorNameSnapshot,
      actorRole: order.createdBy,
      message: `طلبية جديدة من ${order.doctorNameSnapshot} بقيمة ${order.totalAmount}`,
      relatedOrderId: orderId,
      createdAt: FieldValue.serverTimestamp(),
    });

    if (order.createdBy === Roles.doctor) {
      await notifyAdmins(
        `طلبية جديدة من ${order.doctorNameSnapshot}`,
        `${itemsSummary} — الإجمالي: ${order.totalAmount}`,
        { orderId, type: ActivityType.orderCreated }
      );
    }
  }
);
