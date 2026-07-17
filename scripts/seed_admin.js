#!/usr/bin/env node
/**
 * One-time setup script: creates the single real admin Firebase Auth
 * account behind the app's "admin"/"admin" login shortcut (see the
 * SECURITY TRADE-OFF comment on AuthService._obfuscatedAdminPassword in
 * lib/services/firebase/auth_service.dart for the full rationale).
 *
 * Usage:
 *   1. Download a service account key for your Firebase project:
 *      Firebase console -> Project settings -> Service accounts ->
 *      Generate new private key. Save it as scripts/serviceAccountKey.json
 *      (already gitignored — never commit this file).
 *   2. npm install firebase-admin --no-save   (if not already present)
 *   3. node scripts/seed_admin.js
 *   4. The script prints a base64-encoded password. Paste it as the value
 *      of `_obfuscatedAdminPassword` in auth_service.dart, replacing the
 *      placeholder.
 *
 * Re-running this script rotates the admin password (updates the existing
 * account rather than creating a duplicate) — safe to do any time you
 * suspect the embedded credential has leaked, per the plan's mitigation.
 */
const crypto = require("crypto");
const { initializeApp, cert } = require("firebase-admin/app");
const { getAuth } = require("firebase-admin/auth");
const { getFirestore, FieldValue } = require("firebase-admin/firestore");
const serviceAccount = require("./serviceAccountKey.json");

initializeApp({ credential: cert(serviceAccount) });
const auth = getAuth();
const db = getFirestore();

const ADMIN_EMAIL = "admin@dentex.local";

async function main() {
  const password = crypto.randomBytes(18).toString("base64url");

  let userRecord;
  try {
    userRecord = await auth.getUserByEmail(ADMIN_EMAIL);
    await auth.updateUser(userRecord.uid, { password });
    console.log(`Updated existing admin account (${userRecord.uid})`);
  } catch (err) {
    if (err.code === "auth/user-not-found") {
      userRecord = await auth.createUser({
        email: ADMIN_EMAIL,
        password,
        displayName: "Admin",
      });
      console.log(`Created new admin account (${userRecord.uid})`);
    } else {
      throw err;
    }
  }

  await auth.setCustomUserClaims(userRecord.uid, { role: "admin" });

  await db.collection("users").doc(userRecord.uid).set(
    {
      role: "admin",
      phone: "",
      authEmail: ADMIN_EMAIL,
      name: "Admin",
      clinicName: "",
      location: "",
      fcmTokens: [],
      createdAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
    },
    { merge: true }
  );

  const obfuscated = Buffer.from(password, "utf8").toString("base64");
  console.log("\nAdmin account ready.");
  console.log("Paste this into AuthService._obfuscatedAdminPassword:\n");
  console.log(`  static const _obfuscatedAdminPassword = '${obfuscated}';`);
  console.log("\nKeep the plaintext password below in a password manager too:");
  console.log(`  ${password}`);
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error(err);
    process.exit(1);
  });
