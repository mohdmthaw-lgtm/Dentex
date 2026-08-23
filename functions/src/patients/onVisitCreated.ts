import { onDocumentCreated } from "firebase-functions/v2/firestore";
import { FieldValue } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { Paths } from "../lib/constants";

/**
 * Fires on every new visit. A visit freezes its own cost/paidAtVisit at
 * creation time (like an order's totalAmount), so this reconciles the
 * parent patient's stats.totalPaid/totalDebt and the owner's
 * clinicStats/{ownerId}.totalDebt via FieldValue.increment — mirrors
 * onOrderCreated's debt bookkeeping, minus the stock/profit/tier logic
 * that doesn't apply to a patient visit.
 */
export const onVisitCreated = onDocumentCreated(
  `${Paths.visits}/{visitId}`,
  async (event) => {
    const visit = event.data?.data();
    if (!visit) return;
    const patientId = visit.patientId as string;

    const cost = (visit.cost as number) ?? 0;
    const paidAtVisit = (visit.paidAtVisit as number) ?? 0;
    const debtDelta = cost - paidAtVisit;

    await db
      .collection(Paths.patients)
      .doc(patientId)
      .set(
        {
          stats: {
            totalPaid: FieldValue.increment(paidAtVisit),
            totalDebt: FieldValue.increment(debtDelta),
          },
        },
        { merge: true }
      );

    await db
      .collection(Paths.clinicStats)
      .doc(visit.ownerId)
      .set(
        { totalDebt: FieldValue.increment(debtDelta) },
        { merge: true }
      );
  }
);
