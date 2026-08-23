import { onDocumentCreated } from "firebase-functions/v2/firestore";
import { FieldValue } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { Paths } from "../lib/constants";

/**
 * Fires on every new payment recorded against a patient (an append-only
 * ledger — see patient_repository.dart). Unlike onPaymentCreated for
 * orders, no transaction/read is needed here: totalPaid/totalDebt are
 * plain running totals with no derived paymentStatus field to recompute,
 * so a direct FieldValue.increment on both the patient and clinicStats
 * docs is already race-safe.
 */
export const onPatientPaymentCreated = onDocumentCreated(
  `${Paths.patientPayments}/{paymentId}`,
  async (event) => {
    const payment = event.data?.data();
    if (!payment) return;
    const patientId = payment.patientId as string;
    const amount = (payment.amount as number) ?? 0;

    await db
      .collection(Paths.patients)
      .doc(patientId)
      .set(
        {
          stats: {
            totalPaid: FieldValue.increment(amount),
            totalDebt: FieldValue.increment(-amount),
          },
        },
        { merge: true }
      );

    await db
      .collection(Paths.clinicStats)
      .doc(payment.ownerId)
      .set(
        { totalDebt: FieldValue.increment(-amount) },
        { merge: true }
      );
  }
);
