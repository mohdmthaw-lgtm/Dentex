import { onSchedule } from "firebase-functions/v2/scheduler";
import { Timestamp } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { Paths, AppointmentStatus } from "../lib/constants";
import { notifyUser } from "../lib/fcm";
import { jerusalemMidnightUtc } from "../lib/time";
import { resolveAppointmentRecipients } from "./appointmentRecipients";

const timeFormatter = new Intl.DateTimeFormat("ar", {
  timeZone: "Asia/Jerusalem",
  hour: "numeric",
  minute: "2-digit",
});

/**
 * Runs at 22:00 Asia/Jerusalem every day — one notification per doctor
 * with the single earliest appointment they have tomorrow (not every
 * appointment; the spec asks for "الموعد الأول"). A center appointment
 * with no specific assignedDoctorUid reaches every member of that center
 * (see resolveAppointmentRecipients) — each of them gets told about the
 * center's earliest unassigned appointment unless they personally have an
 * even earlier one assigned to them.
 */
export const sendDailyAppointmentDigest = onSchedule(
  { schedule: "0 22 * * *", timeZone: "Asia/Jerusalem" },
  async () => {
    const now = new Date();
    const tomorrowStart = jerusalemMidnightUtc(1, now);
    const tomorrowEnd = jerusalemMidnightUtc(2, now);

    const snap = await db
      .collection(Paths.appointments)
      .where("status", "==", AppointmentStatus.scheduled)
      .where("scheduledAt", ">=", Timestamp.fromDate(tomorrowStart))
      .where("scheduledAt", "<", Timestamp.fromDate(tomorrowEnd))
      .orderBy("scheduledAt")
      .get();
    if (snap.empty) return;

    const centerMembersCache = new Map<string, Promise<string[]>>();
    const earliestByDoctor = new Map<string, FirebaseFirestore.DocumentData>();

    for (const doc of snap.docs) {
      const appt = doc.data();
      const recipients = await resolveAppointmentRecipients(appt, centerMembersCache);
      for (const uid of recipients) {
        // snap.docs is already ascending by scheduledAt, so the first
        // appointment seen for a given uid is necessarily their earliest.
        if (!earliestByDoctor.has(uid)) earliestByDoctor.set(uid, appt);
      }
    }

    await Promise.all(
      Array.from(earliestByDoctor.entries()).map(([uid, appt]) => {
        const time = timeFormatter.format((appt.scheduledAt as Timestamp).toDate());
        return notifyUser(
          uid,
          "أول موعد غدًا",
          `${appt.patientNameSnapshot} — الساعة ${time}`,
          { type: "daily_appointment_digest" }
        );
      })
    );
  }
);
