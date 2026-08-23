import { onSchedule } from "firebase-functions/v2/scheduler";
import { Timestamp } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { Paths, AppointmentStatus } from "../lib/constants";
import { notifyUsers } from "../lib/fcm";
import { resolveAppointmentRecipients } from "./appointmentRecipients";

const timeFormatter = new Intl.DateTimeFormat("ar", {
  timeZone: "Asia/Jerusalem",
  hour: "numeric",
  minute: "2-digit",
});

/**
 * Polls every 5 minutes for appointments landing in a [25, 35) minute
 * window from now — wide enough that a 5-minute poll can never miss one,
 * narrow enough that nobody gets reminded twice for the same slot. The
 * `reminderSent` flag (set at the end of this run, reset by
 * AppointmentRepository.reschedule) is the actual de-dupe guard; the
 * window is just what keeps each run's read set small.
 */
export const sendAppointmentReminders = onSchedule(
  { schedule: "*/5 * * * *", timeZone: "Asia/Jerusalem" },
  async () => {
    const now = Date.now();
    const windowStart = new Date(now + 25 * 60_000);
    const windowEnd = new Date(now + 35 * 60_000);

    const snap = await db
      .collection(Paths.appointments)
      .where("status", "==", AppointmentStatus.scheduled)
      .where("scheduledAt", ">=", Timestamp.fromDate(windowStart))
      .where("scheduledAt", "<", Timestamp.fromDate(windowEnd))
      .get();
    if (snap.empty) return;

    const centerMembersCache = new Map<string, Promise<string[]>>();

    await Promise.all(
      snap.docs.map(async (doc) => {
        const appt = doc.data();
        if (appt.reminderSent) return;

        const recipients = await resolveAppointmentRecipients(appt, centerMembersCache);
        const time = timeFormatter.format((appt.scheduledAt as Timestamp).toDate());
        await notifyUsers(
          recipients,
          "موعد بعد نصف ساعة",
          `${appt.patientNameSnapshot} — الساعة ${time}`,
          { type: "appointment_reminder", appointmentId: doc.id }
        );
        await doc.ref.update({ reminderSent: true });
      })
    );
  }
);
