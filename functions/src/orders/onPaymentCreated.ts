import { onDocumentCreated } from "firebase-functions/v2/firestore";
import { FieldValue } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { Paths, ActivityType, PaymentStatus } from "../lib/constants";

/**
 * Fires on every new payment recorded against an order (an append-only
 * ledger — see order_repository.dart for why payments are never edited in
 * place). Reconciles the order's amountPaid/amountRemaining/paymentStatus
 * and the doctor's/global outstanding-debt counters via
 * FieldValue.increment, safe under concurrent payment recording.
 */
export const onPaymentCreated = onDocumentCreated(
  `${Paths.orders}/{orderId}/${Paths.payments}/{paymentId}`,
  async (event) => {
    const snap = event.data;
    if (!snap) return;
    const payment = snap.data();
    const orderId = event.params.orderId;
    const orderRef = db.collection(Paths.orders).doc(orderId);

    await db.runTransaction(async (tx) => {
      const orderSnap = await tx.get(orderRef);
      if (!orderSnap.exists) return;
      const order = orderSnap.data()!;

      const newAmountPaid = (order.amountPaid ?? 0) + payment.amount;
      const newAmountRemaining = Math.max(0, (order.totalAmount ?? 0) - newAmountPaid);
      const paymentStatus =
        newAmountRemaining <= 0
          ? PaymentStatus.paid
          : newAmountPaid > 0
            ? PaymentStatus.partial
            : PaymentStatus.unpaid;

      tx.update(orderRef, {
        amountPaid: newAmountPaid,
        amountRemaining: newAmountRemaining,
        paymentStatus,
        updatedAt: FieldValue.serverTimestamp(),
      });

      tx.set(
        db.collection(Paths.users).doc(order.doctorId),
        { stats: { totalDebt: FieldValue.increment(-payment.amount) } },
        { merge: true }
      );

      tx.set(
        db.collection(Paths.stats).doc(Paths.statsGlobalDoc),
        { totalOutstandingDebt: FieldValue.increment(-payment.amount) },
        { merge: true }
      );
    });

    await db.collection(Paths.activityLog).add({
      type: ActivityType.paymentRecorded,
      actorUid: payment.recordedByUid,
      actorName: "",
      actorRole: "admin",
      message: `تم تسجيل دفعة بقيمة ${payment.amount} على طلبية`,
      relatedOrderId: orderId,
      createdAt: FieldValue.serverTimestamp(),
    });
  }
);
