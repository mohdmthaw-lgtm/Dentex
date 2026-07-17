import { onCall, HttpsError } from "firebase-functions/v2/https";
import { FieldValue } from "firebase-admin/firestore";
import { auth, db } from "../lib/admin";
import { Paths, Roles } from "../lib/constants";

interface CreateDoctorAccountData {
  phone: string;
  password: string;
  name: string;
  clinicName?: string;
  location?: string;
}

function digitsOnly(phone: string): string {
  return phone.replace(/[^0-9]/g, "");
}

/**
 * Admin-gated callable that provisions a doctor account: creates the
 * Firebase Auth user (synthetic email derived from phone — see
 * lib/core/utils/phone_utils.dart for the matching client-side logic),
 * sets the `role: doctor` custom claim, and writes the Firestore profile,
 * all as one privileged operation only the Admin SDK can perform. Doctor
 * accounts are always admin-provisioned, never self-signup, matching the
 * real-world flow of the company onboarding a doctor client.
 */
export const createDoctorAccount = onCall<CreateDoctorAccountData>(
  async (request) => {
    if (request.auth?.token.role !== Roles.admin) {
      throw new HttpsError(
        "permission-denied",
        "Only an admin account can create doctor accounts."
      );
    }

    const { phone, password, name, clinicName = "", location = "" } = request.data;
    if (!phone || !password || !name) {
      throw new HttpsError("invalid-argument", "phone, password, and name are required.");
    }

    const digits = digitsOnly(phone);
    const syntheticEmail = `${digits}@dentex.local`;

    const userRecord = await auth.createUser({
      email: syntheticEmail,
      password,
      displayName: name,
    });

    await auth.setCustomUserClaims(userRecord.uid, { role: Roles.doctor });

    await db
      .collection(Paths.users)
      .doc(userRecord.uid)
      .set({
        role: Roles.doctor,
        phone,
        authEmail: syntheticEmail,
        name,
        clinicName,
        location,
        fcmTokens: [],
        stats: { totalOrders: 0, totalSpent: 0, totalDebt: 0, lastOrderAt: null },
        createdAt: FieldValue.serverTimestamp(),
        updatedAt: FieldValue.serverTimestamp(),
      });

    await db
      .collection(Paths.stats)
      .doc(Paths.statsGlobalDoc)
      .set({ totalCustomers: FieldValue.increment(1) }, { merge: true });

    return { uid: userRecord.uid };
  }
);
