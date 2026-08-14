#!/usr/bin/env node
// One-time pre-launch cleanup: wipes all test data created while building
// the app, keeping the single admin account and its Firestore doc intact.
// Run backup_before_cleanup.js first — this script is destructive and not
// reversible from within Firestore itself.
//
// Deletes:
//   - users/{uid} where role == "doctor", plus their Firebase Auth account
//   - products (+ variants, costs subcollections)
//   - orders (+ payments, profitData subcollections)
//   - shipments
//   - offers
//   - activityLog
// Resets (not deleted, since these docs are Cloud-Function-owned):
//   - stats/global counters -> 0
//   - stats/global/monthlyProfit/* -> deleted (derived from deleted orders)
//   - counters/shipments -> 0
// Left untouched: users/{uid} where role == "admin", suppliers.
const { initializeApp, cert } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");
const { getAuth } = require("firebase-admin/auth");
const serviceAccount = require("./serviceAccountKey.json");

initializeApp({ credential: cert(serviceAccount) });
const db = getFirestore();
const auth = getAuth();

async function deleteCollectionRecursive(collRef, label) {
  const snap = await collRef.get();
  console.log(`Deleting ${snap.size} doc(s) from ${label} (recursive)...`);
  for (const doc of snap.docs) {
    await db.recursiveDelete(doc.ref);
  }
  console.log(`  done: ${label}`);
}

async function deleteDoctors() {
  const snap = await db.collection("users").where("role", "==", "doctor").get();
  console.log(`Deleting ${snap.size} doctor account(s)...`);
  for (const doc of snap.docs) {
    const uid = doc.id;
    const data = doc.data();
    await doc.ref.delete();
    try {
      await auth.deleteUser(uid);
      console.log(`  deleted doctor ${uid} (${data.name || data.authEmail}) — Firestore doc + Auth account`);
    } catch (err) {
      if (err.code === "auth/user-not-found") {
        console.log(`  deleted doctor ${uid} (${data.name || data.authEmail}) — Firestore doc only (no Auth account found)`);
      } else {
        throw err;
      }
    }
  }
}

async function resetStats() {
  console.log("Resetting stats/global counters to 0...");
  await db.collection("stats").doc("global").set(
    {
      totalProducts: 0,
      totalCustomers: 0,
      totalOrdersAllTime: 0,
      totalOrdersThisMonth: 0,
      totalProfitAllTime: 0,
      totalProfitThisMonth: 0,
      totalOutstandingDebt: 0,
    },
    { merge: true }
  );

  const monthlySnap = await db.collection("stats").doc("global").collection("monthlyProfit").get();
  console.log(`Deleting ${monthlySnap.size} monthlyProfit doc(s)...`);
  for (const doc of monthlySnap.docs) {
    await doc.ref.delete();
  }

  console.log("Resetting counters/shipments to 0...");
  await db.collection("counters").doc("shipments").set({ value: 0 }, { merge: true });
}

async function main() {
  await deleteDoctors();
  await deleteCollectionRecursive(db.collection("products"), "products");
  await deleteCollectionRecursive(db.collection("orders"), "orders");
  await deleteCollectionRecursive(db.collection("shipments"), "shipments");
  await deleteCollectionRecursive(db.collection("offers"), "offers");
  await deleteCollectionRecursive(db.collection("activityLog"), "activityLog");
  await resetStats();

  console.log("\nCleanup complete.");
  const remainingUsers = await db.collection("users").get();
  console.log(`Remaining users/{uid} docs: ${remainingUsers.size}`);
  remainingUsers.docs.forEach((d) => console.log(`  - ${d.id}: role=${d.data().role}, authEmail=${d.data().authEmail}`));
}

main().then(() => process.exit(0)).catch((err) => {
  console.error(err);
  process.exit(1);
});
