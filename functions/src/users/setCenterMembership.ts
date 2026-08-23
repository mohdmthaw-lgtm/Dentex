import { onCall, HttpsError } from "firebase-functions/v2/https";
import { auth, db } from "../lib/admin";
import { Paths, Roles } from "../lib/constants";

interface SetCenterMembershipData {
  uid: string;
  centerId: string;
}

/**
 * Patches an already-created doctor onto a medical center — used for the
 * center's manager, whose account is created *before* the center doc
 * exists (see AccountRequestsScreen._approveCenter on the client: a
 * MedicalCenter needs a managerUid, which only exists once that account is
 * created). Every other member doctor gets centerId passed directly to
 * createDoctorAccount instead.
 *
 * Sets both the Firestore field (read by the app for display/clinicOwnerId)
 * and the `centerId` custom claim (read by firestore.rules' isCenterMember,
 * as a token comparison rather than a get() lookup) — must be a Cloud
 * Function, not a client Firestore write, because only the Admin SDK can
 * set custom claims.
 */
export const setCenterMembership = onCall<SetCenterMembershipData>(
  async (request) => {
    if (request.auth?.token.role !== Roles.admin) {
      throw new HttpsError(
        "permission-denied",
        "Only an admin account can assign center membership."
      );
    }

    const { uid, centerId } = request.data;
    if (!uid || !centerId) {
      throw new HttpsError("invalid-argument", "uid and centerId are required.");
    }

    await auth.setCustomUserClaims(uid, { role: Roles.doctor, centerId });

    await db.collection(Paths.users).doc(uid).update({
      centerId,
      accountType: "center",
    });
  }
);
