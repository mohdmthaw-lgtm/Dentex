// Verifies the exact same login + Firestore path the iOS app uses, via the
// Firebase CLIENT SDK (not Admin SDK) so security rules are genuinely
// enforced — not bypassed. Confirms: (1) synthetic-email/password sign-in
// works with the real seeded admin password, (2) the `role: admin` custom
// claim is present on the resulting token, (3) an admin-only Firestore read
// succeeds, (4) an admin-only Firestore write + read-back succeeds.
const { initializeApp } = require("firebase/app");
const { getAuth, signInWithEmailAndPassword } = require("firebase/auth");
const {
  getFirestore,
  doc,
  getDoc,
  setDoc,
  deleteDoc,
} = require("firebase/firestore");

// Same values as lib/firebase_options.dart (ios block).
const firebaseConfig = {
  apiKey: "AIzaSyCx-sAJ7b1ONWpNaIWPDkRO0V4hOVhTHDs",
  appId: "1:905271965425:ios:9a03a96efdf9881a839b50",
  messagingSenderId: "905271965425",
  projectId: "dentex-fede7",
  storageBucket: "dentex-fede7.firebasestorage.app",
};

const ADMIN_PASSWORD = process.argv[2];
if (!ADMIN_PASSWORD) {
  console.error("Usage: node verify_client_e2e.js <admin-password>");
  process.exit(1);
}

async function main() {
  const app = initializeApp(firebaseConfig);
  const auth = getAuth(app);
  const db = getFirestore(app);

  console.log("1) Signing in as admin@dentex.local ...");
  const cred = await signInWithEmailAndPassword(auth, "admin@dentex.local", ADMIN_PASSWORD);
  console.log("   OK — uid:", cred.user.uid);

  const tokenResult = await cred.user.getIdTokenResult(true);
  console.log("2) Custom claims:", tokenResult.claims);
  if (tokenResult.claims.role !== "admin") {
    throw new Error("role custom claim missing/incorrect");
  }

  console.log("3) Reading stats/global (admin-only read per firestore.rules) ...");
  const statsSnap = await getDoc(doc(db, "stats", "global"));
  console.log("   OK — exists:", statsSnap.exists(), "data:", statsSnap.data());

  console.log("4) Writing + reading back a throwaway test doc ...");
  const testRef = doc(db, "activityLog", "e2e-verify-test");
  await setDoc(testRef, {
    type: "e2e_verify",
    actorUid: cred.user.uid,
    actorName: "E2E script",
    actorRole: "admin",
    message: "Client-SDK end-to-end verification write",
    createdAt: new Date(),
  });
  const readBack = await getDoc(testRef);
  console.log("   OK — wrote and read back:", readBack.data().message);
  await deleteDoc(testRef);
  console.log("   Cleaned up test doc.");

  console.log("\nALL CHECKS PASSED: login + Firestore read + Firestore write all work with the real backend.");
  process.exit(0);
}

main().catch((e) => {
  console.error("FAILED:", e);
  process.exit(1);
});
