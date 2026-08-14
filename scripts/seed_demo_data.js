#!/usr/bin/env node
// Temporary demo data for App Store screenshots only. Mirrors the exact
// shape createDoctorAccount.ts / the order/product/offer forms produce, so
// Cloud Function triggers (stock, stats, activity log, loyalty tier) fire
// naturally. Run cleanup_prelaunch.js afterward to remove all of this.
const { initializeApp, cert } = require("firebase-admin/app");
const { getFirestore, FieldValue, Timestamp } = require("firebase-admin/firestore");
const { getAuth } = require("firebase-admin/auth");
const serviceAccount = require("./serviceAccountKey.json");

initializeApp({ credential: cert(serviceAccount) });
const db = getFirestore();
const auth = getAuth();

async function createDoctor() {
  const phone = "0598765432";
  const syntheticEmail = `${phone}@dentex.local`;
  const userRecord = await auth.createUser({
    email: syntheticEmail,
    password: "Demo12345!",
    displayName: "د. سامر يوسف",
  });
  await auth.setCustomUserClaims(userRecord.uid, { role: "doctor" });
  await db.collection("users").doc(userRecord.uid).set({
    role: "doctor",
    phone,
    authEmail: syntheticEmail,
    name: "د. سامر يوسف",
    clinicName: "عيادة النور لطب الأسنان",
    location: "رام الله - الماصيون",
    fcmTokens: [],
    stats: { totalOrders: 0, totalSpent: 0, totalDebt: 0, lastOrderAt: null },
    createdAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
  });
  await db.collection("stats").doc("global").set({ totalCustomers: FieldValue.increment(1) }, { merge: true });
  console.log("doctor uid:", userRecord.uid);
  return userRecord.uid;
}

async function createProduct({ name, manufacturer, lowStockThreshold, variants }) {
  const productRef = db.collection("products").doc();
  await productRef.set({
    name,
    manufacturer,
    description: "",
    imageUrl: "",
    imagePath: "",
    lowStockThreshold,
    isActive: true,
    totalQuantity: 0,
    variantSummaries: [],
    createdAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
  });

  const variantIds = [];
  for (const v of variants) {
    const variantRef = productRef.collection("variants").doc();
    await variantRef.set({
      label: v.label,
      sellPrice: v.sellPrice,
      quantity: v.quantity,
      totalSold: 0,
      imageUrl: "",
      imagePath: "",
      productName: name,
      createdAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
    });
    await productRef.collection("costs").doc(variantRef.id).set({ costPrice: v.costPrice });
    variantIds.push({ variantId: variantRef.id, label: v.label, sellPrice: v.sellPrice });
  }
  console.log("product:", name, productRef.id);
  return { productId: productRef.id, variants: variantIds };
}

async function createOffer({ title, items, offerPrice }) {
  const offerRef = db.collection("offers").doc();
  await offerRef.set({
    title,
    description: "",
    imageUrl: "",
    imagePath: "",
    items,
    offerPrice,
    isActive: true,
    startDate: null,
    endDate: null,
    createdAt: FieldValue.serverTimestamp(),
    timesSold: 0,
    unitsSold: 0,
    totalRevenue: 0,
    totalDiscountGiven: 0,
  });
  console.log("offer:", title, offerRef.id);
}

async function createOrder({ doctorId, doctorName, items, status, paymentStatus, amountPaid }) {
  const subtotal = items.reduce((s, i) => s + i.lineTotal, 0);
  const orderRef = db.collection("orders").doc();
  await orderRef.set({
    doctorId,
    doctorNameSnapshot: doctorName,
    doctorPhoneSnapshot: "0598765432",
    createdBy: "admin",
    createdByUid: "demo-admin",
    status,
    items,
    subtotalAmount: subtotal,
    discountRate: 0,
    discountAmount: 0,
    totalAmount: subtotal,
    amountPaid,
    amountRemaining: subtotal - amountPaid,
    paymentStatus,
    notes: "",
    createdAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
    completedAt: status === "completed" ? FieldValue.serverTimestamp() : null,
  });
  console.log("order:", orderRef.id, subtotal);
}

async function main() {
  const doctorId = await createDoctor();

  const gloves = await createProduct({
    name: "قفازات فحص لاتكس",
    manufacturer: "Medline",
    lowStockThreshold: 20,
    variants: [
      { label: "علبة 100 قطعة - مقاس صغير", sellPrice: 45, quantity: 200, costPrice: 30 },
      { label: "علبة 100 قطعة - مقاس متوسط", sellPrice: 45, quantity: 150, costPrice: 30 },
    ],
  });

  const masks = await createProduct({
    name: "كمامات جراحية 3 طبقات",
    manufacturer: "3M",
    lowStockThreshold: 30,
    variants: [{ label: "علبة 50 قطعة", sellPrice: 35, quantity: 300, costPrice: 22 }],
  });

  const composite = await createProduct({
    name: "حشوة ضوئية كومبوزيت",
    manufacturer: "3M ESPE",
    lowStockThreshold: 10,
    variants: [
      { label: "لون A2", sellPrice: 120, quantity: 40, costPrice: 80 },
      { label: "لون A3", sellPrice: 120, quantity: 35, costPrice: 80 },
    ],
  });

  const sutures = await createProduct({
    name: "خيوط جراحية قابلة للامتصاص",
    manufacturer: "Ethicon",
    lowStockThreshold: 15,
    variants: [{ label: "علبة 12 قطعة", sellPrice: 95, quantity: 60, costPrice: 60 }],
  });

  await createOffer({
    title: "باقة قفازات وكمامات",
    offerPrice: 70,
    items: [
      { productId: gloves.productId, productName: "قفازات فحص لاتكس", variantId: gloves.variants[0].variantId, variantLabel: gloves.variants[0].label, unitPrice: gloves.variants[0].sellPrice, quantity: 1 },
      { productId: masks.productId, productName: "كمامات جراحية 3 طبقات", variantId: masks.variants[0].variantId, variantLabel: masks.variants[0].label, unitPrice: masks.variants[0].sellPrice, quantity: 1 },
    ],
  });

  await createOffer({
    title: "عرض مستلزمات الحشوات",
    offerPrice: 210,
    items: [
      { productId: composite.productId, productName: "حشوة ضوئية كومبوزيت", variantId: composite.variants[0].variantId, variantLabel: composite.variants[0].label, unitPrice: composite.variants[0].sellPrice, quantity: 2 },
    ],
  });

  const doctorName = "د. سامر يوسف";
  await createOrder({
    doctorId,
    doctorName,
    status: "completed",
    paymentStatus: "paid",
    amountPaid: 900,
    items: [
      { productId: gloves.productId, productName: "قفازات فحص لاتكس", variantId: gloves.variants[0].variantId, variantLabel: gloves.variants[0].label, unitSellPrice: 45, quantity: 10, lineTotal: 450 },
      { productId: composite.productId, productName: "حشوة ضوئية كومبوزيت", variantId: composite.variants[0].variantId, variantLabel: composite.variants[0].label, unitSellPrice: 120, quantity: 3, lineTotal: 360 },
      { productId: masks.productId, productName: "كمامات جراحية 3 طبقات", variantId: masks.variants[0].variantId, variantLabel: masks.variants[0].label, unitSellPrice: 35, quantity: 3, lineTotal: 90 },
    ],
  });

  await createOrder({
    doctorId,
    doctorName,
    status: "completed",
    paymentStatus: "paid",
    amountPaid: 850,
    items: [
      { productId: sutures.productId, productName: "خيوط جراحية قابلة للامتصاص", variantId: sutures.variants[0].variantId, variantLabel: sutures.variants[0].label, unitSellPrice: 95, quantity: 6, lineTotal: 570 },
      { productId: composite.productId, productName: "حشوة ضوئية كومبوزيت", variantId: composite.variants[1].variantId, variantLabel: composite.variants[1].label, unitSellPrice: 120, quantity: 2, lineTotal: 240 },
      { productId: masks.productId, productName: "كمامات جراحية 3 طبقات", variantId: masks.variants[0].variantId, variantLabel: masks.variants[0].label, unitSellPrice: 35, quantity: 1, lineTotal: 35 },
    ],
  });

  await createOrder({
    doctorId,
    doctorName,
    status: "waiting",
    paymentStatus: "unpaid",
    amountPaid: 0,
    items: [
      { productId: gloves.productId, productName: "قفازات فحص لاتكس", variantId: gloves.variants[1].variantId, variantLabel: gloves.variants[1].label, unitSellPrice: 45, quantity: 5, lineTotal: 225 },
      { productId: masks.productId, productName: "كمامات جراحية 3 طبقات", variantId: masks.variants[0].variantId, variantLabel: masks.variants[0].label, unitSellPrice: 35, quantity: 5, lineTotal: 175 },
    ],
  });

  console.log("\nDemo data seeded.");
}

main().then(() => process.exit(0)).catch((err) => {
  console.error(err);
  process.exit(1);
});
