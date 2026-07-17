import { onDocumentWritten } from "firebase-functions/v2/firestore";
import { FieldValue } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { Paths, ActivityType } from "../lib/constants";

/**
 * Maintains stats/global.totalProducts (create/delete only) and writes an
 * activity-log entry for product add/edit, so the admin dashboard's
 * product count and activity feed don't require a full collection scan.
 */
export const onProductWrite = onDocumentWritten(
  `${Paths.products}/{productId}`,
  async (event) => {
    const before = event.data?.before;
    const after = event.data?.after;
    const productId = event.params.productId;

    const created = !before?.exists && after?.exists;
    const deleted = before?.exists && !after?.exists;

    if (created) {
      await db
        .collection(Paths.stats)
        .doc(Paths.statsGlobalDoc)
        .set({ totalProducts: FieldValue.increment(1) }, { merge: true });

      await db.collection(Paths.activityLog).add({
        type: ActivityType.productAdded,
        actorUid: "",
        actorName: "",
        actorRole: "admin",
        message: `تمت إضافة منتج جديد: ${after?.data()?.name ?? ""}`,
        relatedProductId: productId,
        createdAt: FieldValue.serverTimestamp(),
      });
    } else if (deleted) {
      await db
        .collection(Paths.stats)
        .doc(Paths.statsGlobalDoc)
        .set({ totalProducts: FieldValue.increment(-1) }, { merge: true });
    } else if (before?.exists && after?.exists) {
      // A plain field edit (name/description/threshold) — variant-level
      // edits are handled separately by onVariantWrite.
      const beforeData = before.data();
      const afterData = after.data();
      if (beforeData?.name !== afterData?.name || beforeData?.description !== afterData?.description) {
        await db.collection(Paths.activityLog).add({
          type: ActivityType.productEdited,
          actorUid: "",
          actorName: "",
          actorRole: "admin",
          message: `تم تعديل المنتج: ${afterData?.name ?? ""}`,
          relatedProductId: productId,
          createdAt: FieldValue.serverTimestamp(),
        });
      }
    }
  }
);
