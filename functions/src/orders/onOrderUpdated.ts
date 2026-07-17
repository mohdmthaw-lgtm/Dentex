import { onDocumentUpdated } from "firebase-functions/v2/firestore";
import { FieldValue, Timestamp } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { Paths, ActivityType, OrderStatus, monthKeyFor } from "../lib/constants";

interface OrderItem {
  productId: string;
  productName: string;
  variantId: string;
  variantLabel: string;
  unitSellPrice: number;
  quantity: number;
  lineTotal: number;
}

const STATUS_LABELS: Record<string, string> = {
  [OrderStatus.waiting]: "انتظار",
  [OrderStatus.inProgress]: "جاري",
  [OrderStatus.completed]: "مكتمل",
  [OrderStatus.cancelled]: "ملغي",
};

/**
 * Handles the two things that can change on an order after creation:
 * status transitions and (admin-only) item edits. Deliberately split into
 * two independent blocks below rather than one combined branch, because
 * they can both happen in the same write and each has its own reconciliation.
 */
export const onOrderUpdated = onDocumentUpdated(
  `${Paths.orders}/{orderId}`,
  async (event) => {
    const before = event.data?.before.data();
    const after = event.data?.after.data();
    if (!before || !after) return;
    const orderId = event.params.orderId;
    const orderRef = db.collection(Paths.orders).doc(orderId);

    // --- Status transitions -------------------------------------------
    if (before.status !== after.status) {
      await db.collection(Paths.activityLog).add({
        type: ActivityType.orderStatusChanged,
        actorUid: after.createdByUid ?? "",
        actorName: after.doctorNameSnapshot ?? "",
        actorRole: "admin",
        message: `تغيرت حالة طلبية ${after.doctorNameSnapshot} إلى ${
          STATUS_LABELS[after.status] ?? after.status
        }`,
        relatedOrderId: orderId,
        createdAt: FieldValue.serverTimestamp(),
      });

      const enteringCompleted =
        after.status === OrderStatus.completed &&
        before.status !== OrderStatus.completed;
      const leavingCompleted =
        before.status === OrderStatus.completed &&
        after.status !== OrderStatus.completed;

      if (enteringCompleted || leavingCompleted) {
        const profitSnap = await orderRef
          .collection(Paths.profitData)
          .doc(Paths.profitDataSummaryDoc)
          .get();
        const totalProfit = (profitSnap.data()?.totalProfit as number) ?? 0;
        const sign = enteringCompleted ? 1 : -1;
        const now = Timestamp.now();
        const monthKey = monthKeyFor(now.toDate());

        await db
          .collection(Paths.stats)
          .doc(Paths.statsGlobalDoc)
          .set(
            {
              totalProfitAllTime: FieldValue.increment(sign * totalProfit),
              totalProfitThisMonth: FieldValue.increment(sign * totalProfit),
            },
            { merge: true }
          );

        await db
          .collection(Paths.stats)
          .doc(Paths.statsGlobalDoc)
          .collection(Paths.monthlyProfit)
          .doc(monthKey)
          .set(
            {
              totalProfit: FieldValue.increment(sign * totalProfit),
              totalOrders: FieldValue.increment(sign * 1),
              totalRevenue: FieldValue.increment(sign * (after.totalAmount ?? 0)),
            },
            { merge: true }
          );

        await orderRef.update({
          completedAt: enteringCompleted ? FieldValue.serverTimestamp() : null,
        });
      }
    }

    // --- Item edits (admin manually adjusts a placed order) ------------
    // Flagged in the plan as the most complex reconciliation path: restore
    // stock for removed/reduced quantities, apply stock for added/increased
    // quantities, and recompute totals. Only runs when items actually
    // changed, which for the current app is a rare admin correction rather
    // than the common path.
    if (JSON.stringify(before.items) !== JSON.stringify(after.items)) {
      const beforeItems: OrderItem[] = before.items ?? [];
      const afterItems: OrderItem[] = after.items ?? [];

      const deltasByVariant = new Map<
        string,
        { productId: string; variantId: string; delta: number }
      >();
      const key = (productId: string, variantId: string) => `${productId}::${variantId}`;

      for (const item of beforeItems) {
        const k = key(item.productId, item.variantId);
        const existing = deltasByVariant.get(k) ?? {
          productId: item.productId,
          variantId: item.variantId,
          delta: 0,
        };
        // Removing this line item restores stock (+quantity).
        existing.delta += item.quantity;
        deltasByVariant.set(k, existing);
      }
      for (const item of afterItems) {
        const k = key(item.productId, item.variantId);
        const existing = deltasByVariant.get(k) ?? {
          productId: item.productId,
          variantId: item.variantId,
          delta: 0,
        };
        // Re-applying the new line item consumes stock again (-quantity).
        existing.delta -= item.quantity;
        deltasByVariant.set(k, existing);
      }

      await Promise.all(
        Array.from(deltasByVariant.values())
          .filter((d) => d.delta !== 0)
          .map((d) =>
            db
              .collection(Paths.products)
              .doc(d.productId)
              .collection(Paths.variants)
              .doc(d.variantId)
              .update({
                quantity: FieldValue.increment(d.delta),
                updatedAt: FieldValue.serverTimestamp(),
              })
          )
      );

      const newTotalAmount = afterItems.reduce((sum, i) => sum + i.lineTotal, 0);
      const newAmountRemaining = newTotalAmount - (after.amountPaid ?? 0);

      // Recompute the profit snapshot against current admin-only cost data.
      const costDocs = await Promise.all(
        afterItems.map((item) =>
          db
            .collection(Paths.products)
            .doc(item.productId)
            .collection(Paths.costs)
            .doc(item.variantId)
            .get()
        )
      );
      let totalCost = 0;
      let newTotalProfit = 0;
      const profitItems = afterItems.map((item, i) => {
        const unitCostPrice = (costDocs[i].data()?.costPrice as number) ?? 0;
        const lineCost = unitCostPrice * item.quantity;
        const lineProfit = item.lineTotal - lineCost;
        totalCost += lineCost;
        newTotalProfit += lineProfit;
        return { variantId: item.variantId, unitCostPrice, lineProfit };
      });

      const profitRef = orderRef
        .collection(Paths.profitData)
        .doc(Paths.profitDataSummaryDoc);
      const oldProfitSnap = await profitRef.get();
      const oldTotalProfit = (oldProfitSnap.data()?.totalProfit as number) ?? 0;

      await profitRef.set({ items: profitItems, totalCost, totalProfit: newTotalProfit });
      await orderRef.update({
        totalAmount: newTotalAmount,
        amountRemaining: newAmountRemaining,
      });

      // If this order was already completed, its profit was already
      // applied to the monthly/global aggregates — adjust by the delta so
      // editing a completed order's items doesn't silently corrupt reports.
      if (after.status === OrderStatus.completed && oldTotalProfit !== newTotalProfit) {
        const profitDelta = newTotalProfit - oldTotalProfit;
        const monthKey = after.completedAt
          ? monthKeyFor((after.completedAt as Timestamp).toDate())
          : monthKeyFor(new Date());
        await db
          .collection(Paths.stats)
          .doc(Paths.statsGlobalDoc)
          .set(
            {
              totalProfitAllTime: FieldValue.increment(profitDelta),
              totalProfitThisMonth: FieldValue.increment(profitDelta),
            },
            { merge: true }
          );
        await db
          .collection(Paths.stats)
          .doc(Paths.statsGlobalDoc)
          .collection(Paths.monthlyProfit)
          .doc(monthKey)
          .set({ totalProfit: FieldValue.increment(profitDelta) }, { merge: true });
      }
    }
  }
);
