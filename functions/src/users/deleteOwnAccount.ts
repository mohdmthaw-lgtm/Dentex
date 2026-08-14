import { onCall, HttpsError } from "firebase-functions/v2/https";
import { auth, db } from "../lib/admin";
import { Paths } from "../lib/constants";

/**
 * Self-service account deletion (App Store Guideline 5.1.1(v) — any app
 * that supports account creation must also support account deletion, not
 * just deactivation). Deliberately not admin-gated: any signed-in user may
 * delete only their own account (`request.auth.uid`), never someone else's.
 * Deletes the Firebase Auth user and the Firestore profile doc; historical
 * orders/payments are left untouched since they already carry frozen
 * name/phone snapshots (see Order.doctorNameSnapshot) and don't depend on
 * the profile doc existing.
 */
export const deleteOwnAccount = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "You must be signed in to delete your account.");
  }

  const uid = request.auth.uid;

  await db.collection(Paths.users).doc(uid).delete();
  await auth.deleteUser(uid);

  return { success: true };
});
