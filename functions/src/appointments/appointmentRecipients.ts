import { db } from "../lib/admin";
import { Paths, OwnerType } from "../lib/constants";

/**
 * Every doctor who should hear about one appointment: the doctor it's
 * specifically assigned to (see Appointment.assignedDoctorUid's doc
 * comment) if set, the clinic's sole doctor for a solo-owned appointment,
 * or — when a center appointment has no assignment — every member of that
 * center, since nothing on the appointment says which one of them it's
 * for.
 *
 * [centerMembersCache] is per-invocation (a fresh Map passed in by each
 * scheduled function's own run), not module-level — a center's membership
 * can change between runs, and a Cloud Functions instance can be reused
 * across separate scheduled invocations, so caching across runs would
 * risk serving stale membership.
 */
export async function resolveAppointmentRecipients(
  appt: FirebaseFirestore.DocumentData,
  centerMembersCache: Map<string, Promise<string[]>>
): Promise<string[]> {
  const assignedDoctorUid = appt.assignedDoctorUid as string | undefined;
  if (assignedDoctorUid) return [assignedDoctorUid];

  if (appt.ownerType !== OwnerType.center) return [appt.ownerId as string];

  const centerId = appt.ownerId as string;
  if (!centerMembersCache.has(centerId)) {
    centerMembersCache.set(
      centerId,
      db
        .collection(Paths.medicalCenters)
        .doc(centerId)
        .get()
        .then((doc) => (doc.data()?.memberUids as string[] | undefined) ?? [])
    );
  }
  return centerMembersCache.get(centerId)!;
}
