import { onDocumentWritten } from "firebase-functions/v2/firestore";
import { FieldValue } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { notifyAdmins } from "../lib/fcm";
import { Paths, ActivityType } from "../lib/constants";

/**
 * Fires on every create/update/delete under products/{productId}/variants.
 * Two responsibilities:
 *   1. Keep the parent product's variantSummaries/totalQuantity read-cache
 *      in sync (so list screens never do an N+1 read into variants).
 *   2. Detect a stock quantity CROSSING the half-threshold or zero point,
 *      and only then notify — comparing before vs. after, not "currently
 *      below", so admin doesn't get re-notified on every unrelated edit
 *      while stock is already low.
 */
export const onVariantWrite = onDocumentWritten(
  `${Paths.products}/{productId}/${Paths.variants}/{variantId}`,
  async (event) => {
    const productId = event.params.productId;
    const productRef = db.collection(Paths.products).doc(productId);

    // 1. Recompute variantSummaries + totalQuantity from the current state
    // of every variant under this product.
    const variantsSnap = await productRef.collection(Paths.variants).get();
    const variantSummaries = variantsSnap.docs.map((d) => ({
      variantId: d.id,
      label: d.data().label,
      sellPrice: d.data().sellPrice,
      quantity: d.data().quantity ?? 0,
    }));
    const totalQuantity = variantSummaries.reduce((sum, v) => sum + v.quantity, 0);

    await productRef.set(
      { variantSummaries, totalQuantity, updatedAt: FieldValue.serverTimestamp() },
      { merge: true }
    );

    // 2. Threshold-crossing detection for low-stock/out-of-stock alerts.
    const after = event.data?.after.exists ? event.data.after.data() : null;
    const before = event.data?.before.exists ? event.data.before.data() : null;
    if (!after) return; // deleted — nothing to alert on

    const productSnap = await productRef.get();
    const threshold = (productSnap.data()?.lowStockThreshold as number) ?? 0;
    if (threshold <= 0) return;

    const beforeQty = before?.quantity ?? Number.POSITIVE_INFINITY; // treat "just created" as never-low before
    const afterQty = after.quantity ?? 0;
    const productName = productSnap.data()?.name ?? "";
    const halfThreshold = threshold / 2;

    const crossedToZero = beforeQty > 0 && afterQty <= 0;
    const crossedToHalf =
      !crossedToZero && beforeQty > halfThreshold && afterQty <= halfThreshold && afterQty > 0;

    if (crossedToZero) {
      await notifyAdmins(
        "نفذ المخزون",
        `${productName} - ${after.label} نفذ من المخزون`,
        { productId, variantId: event.params.variantId, type: ActivityType.stockOut }
      );
      await db.collection(Paths.activityLog).add({
        type: ActivityType.stockOut,
        actorUid: "system",
        actorName: "النظام",
        actorRole: "system",
        message: `نفذ مخزون ${productName} - ${after.label}`,
        relatedProductId: productId,
        createdAt: FieldValue.serverTimestamp(),
      });
    } else if (crossedToHalf) {
      await notifyAdmins(
        "مخزون منخفض",
        `${productName} - ${after.label} اقترب من النفاد (${afterQty} متبقي)`,
        { productId, variantId: event.params.variantId, type: ActivityType.stockLow }
      );
      await db.collection(Paths.activityLog).add({
        type: ActivityType.stockLow,
        actorUid: "system",
        actorName: "النظام",
        actorRole: "system",
        message: `مخزون منخفض: ${productName} - ${after.label} (${afterQty} متبقي)`,
        relatedProductId: productId,
        createdAt: FieldValue.serverTimestamp(),
      });
    }
  }
);
