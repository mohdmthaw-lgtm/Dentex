import { onDocumentCreated } from "firebase-functions/v2/firestore";
import { FieldValue, Timestamp } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { Paths } from "../lib/constants";
import { notifyUser } from "../lib/fcm";

const timeFormatter = new Intl.DateTimeFormat("ar", {
  timeZone: "Asia/Jerusalem",
  weekday: "long",
  day: "numeric",
  month: "long",
  hour: "numeric",
  minute: "2-digit",
});

/**
 * Bumps clinicStats/{ownerId}.totalPatients whenever a new patient is
 * added — the one denormalized counter the accounting dashboard needs that
 * isn't already covered by onVisitCreated/onPatientPaymentCreated's debt
 * bookkeeping.
 *
 * Also notifies the assigned doctor when a medical center's manager
 * creates a patient on their behalf (see Patient.assignedDoctorUid's doc
 * comment) — never for a patient a doctor creates for themselves.
 */
export const onPatientCreated = onDocumentCreated(
  `${Paths.patients}/{patientId}`,
  async (event) => {
    const patient = event.data?.data();
    if (!patient) return;

    await db
      .collection(Paths.clinicStats)
      .doc(patient.ownerId)
      .set(
        { totalPatients: FieldValue.increment(1) },
        { merge: true }
      );

    const assignedDoctorUid = patient.assignedDoctorUid as string | undefined;
    if (!assignedDoctorUid || assignedDoctorUid === patient.createdByUid) return;

    // The manager's patient_form_screen.dart flow writes the optional
    // first appointment *before* the patient doc (see
    // PatientRepository.reservePatientId's doc comment), so it's already
    // committed and queryable here — no race.
    const apptSnap = await db
      .collection(Paths.appointments)
      .where("patientId", "==", event.params.patientId)
      .limit(1)
      .get();
    const appointmentLabel = apptSnap.empty
      ? ""
      : ` — الموعد: ${timeFormatter.format((apptSnap.docs[0].data().scheduledAt as Timestamp).toDate())}`;

    await notifyUser(
      assignedDoctorUid,
      `مريض جديد مُسند إلى د. ${patient.assignedDoctorNameSnapshot ?? ""}`,
      `${patient.name}${appointmentLabel}`,
      { patientId: event.params.patientId, type: "patient_assigned" }
    );
  }
);
