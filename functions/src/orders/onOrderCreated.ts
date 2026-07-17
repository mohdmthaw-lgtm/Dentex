import { onDocumentCreated } from "firebase-functions/v2/firestore";
import { FieldValue } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { notifyAdmins } from "../lib/fcm";
import { Paths, ActivityType, Roles } from "../lib/constants";

interface OrderItem {
  productId: string;
  productName: string;
  variantId: string;
  variantLabel: string;
  unitSellPrice: number;
  quantity: number;
  lineTotal: number;
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
    let totalCost = 0;
    let totalProfit = 0;
    const profitItems = items.map((item, i) => {
      const unitCostPrice = (costDocs[i].data()?.costPrice as number) ?? 0;
      const lineCost = unitCostPrice * item.quantity;
      const lineProfit = item.lineTotal - lineCost;
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
