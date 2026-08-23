import { onDocumentCreated } from "firebase-functions/v2/firestore";
import { db } from "../lib/admin";
import { Paths, PaymentStatus } from "../lib/constants";

/**
 * Mirrors onPaymentCreated (orders) exactly, minus the doctor/global debt
 * counters — an expense's amountPaid/amountRemaining/paymentStatus only
 * ever need reconciling on the expense doc itself, since nothing else
 * denormalizes off of it (the net-profit dashboard sums expenses/{ownerId
 * range query} live, not a running counter).
 */
export const onExpensePaymentCreated = onDocumentCreated(
  `${Paths.expenses}/{expenseId}/${Paths.payments}/{paymentId}`,
  async (event) => {
    const snap = event.data;
    if (!snap) return;
    const payment = snap.data();
    const expenseId = event.params.expenseId;
    const expenseRef = db.collection(Paths.expenses).doc(expenseId);

    await db.runTransaction(async (tx) => {
      const expenseSnap = await tx.get(expenseRef);
      if (!expenseSnap.exists) return;
      const expense = expenseSnap.data()!;

      const newAmountPaid = (expense.amountPaid ?? 0) + payment.amount;
      const newAmountRemaining = Math.max(0, (expense.totalAmount ?? 0) - newAmountPaid);
      const paymentStatus =
        newAmountRemaining <= 0
          ? PaymentStatus.paid
          : newAmountPaid > 0
            ? PaymentStatus.partial
            : PaymentStatus.unpaid;

      tx.update(expenseRef, {
        amountPaid: newAmountPaid,
        amountRemaining: newAmountRemaining,
        paymentStatus,
      });
    });
  }
);
