#!/usr/bin/env node
// Dumps every collection touched by cleanup_prelaunch.js (plus the untouched
// ones, for completeness) to a timestamped local JSON file, so the prelaunch
// cleanup has a real rollback path. Read-only — makes no writes.
const fs = require("fs");
const path = require("path");
const { initializeApp, cert } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");
const serviceAccount = require("./serviceAccountKey.json");

initializeApp({ credential: cert(serviceAccount) });
const db = getFirestore();

async function dumpCollection(collRef, includeSubcollections = []) {
  const snap = await collRef.get();
  const docs = [];
  for (const doc of snap.docs) {
    const entry = { id: doc.id, data: doc.data() };
    for (const sub of includeSubcollections) {
      const subSnap = await doc.ref.collection(sub).get();
      entry[sub] = subSnap.docs.map((d) => ({ id: d.id, data: d.data() }));
    }
    docs.push(entry);
  }
  return docs;
}

async function main() {
  const backup = {
    createdAt: new Date().toISOString(),
    projectId: serviceAccount.project_id,
    users: await dumpCollection(db.collection("users")),
    products: await dumpCollection(db.collection("products"), ["variants", "costs"]),
    orders: await dumpCollection(db.collection("orders"), ["payments", "profitData"]),
    shipments: await dumpCollection(db.collection("shipments")),
    offers: await dumpCollection(db.collection("offers")),
    suppliers: await dumpCollection(db.collection("suppliers")),
    activityLog: await dumpCollection(db.collection("activityLog")),
    statsGlobal: (await db.collection("stats").doc("global").get()).data() || null,
    monthlyProfit: await dumpCollection(db.collection("stats").doc("global").collection("monthlyProfit")),
    countersShipments: (await db.collection("counters").doc("shipments").get()).data() || null,
  };

  const dir = path.join(__dirname, "backups");
  fs.mkdirSync(dir, { recursive: true });
  const stamp = backup.createdAt.replace(/[:.]/g, "-");
  const file = path.join(dir, `firestore-backup-${stamp}.json`);
  fs.writeFileSync(file, JSON.stringify(backup, null, 2));

  console.log(`Backup written to ${file}`);
  console.log(`  users: ${backup.users.length}`);
  console.log(`  products: ${backup.products.length}`);
  console.log(`  orders: ${backup.orders.length}`);
  console.log(`  shipments: ${backup.shipments.length}`);
  console.log(`  offers: ${backup.offers.length}`);
  console.log(`  suppliers: ${backup.suppliers.length}`);
  console.log(`  activityLog: ${backup.activityLog.length}`);
}

main().then(() => process.exit(0)).catch((err) => {
  console.error(err);
  process.exit(1);
});
