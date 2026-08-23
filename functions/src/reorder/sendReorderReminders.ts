import { onSchedule } from "firebase-functions/v2/scheduler";
import { Timestamp } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { Paths, Roles } from "../lib/constants";
import { notifyUser } from "../lib/fcm";

interface ConsumptionMapping {
  treatmentType: string;
  productId: string;
  productName: string;
  variantId: string;
  variantLabel: string;
  quantityPerTreatment: number;
}

interface Visit {
  treatmentType: string;
  visitDate?: Timestamp;
}

interface OrderItem {
  productId: string;
  variantId: string;
  quantity: number;
}

/**
 * Server-side port of lib/core/utils/reorder_suggestions.dart's
 * computeReorderSuggestions — same "compare last-ordered quantity against
 * treatments recorded since that order" logic, see that file's doc
 * comment for the full reasoning. Kept as a literal port rather than a
 * shared package so the two stay easy to diff against each other if the
 * algorithm ever changes.
 */
function computeDueMappings(
  mappings: ConsumptionMapping[],
  visits: Visit[],
  orders: { createdAt?: Timestamp; items: OrderItem[] }[]
): ConsumptionMapping[] {
  const due: ConsumptionMapping[] = [];

  for (const mapping of mappings) {
    let lastOrderDate: Date | undefined;
    let lastOrderedQuantity = 0;

    for (const order of orders) {
      if (!order.createdAt) continue;
      for (const item of order.items ?? []) {
        if (item.productId !== mapping.productId || item.variantId !== mapping.variantId) continue;
        const createdAt = order.createdAt.toDate();
        if (!lastOrderDate || createdAt > lastOrderDate) {
          lastOrderDate = createdAt;
          lastOrderedQuantity = item.quantity;
        }
      }
    }
    if (!lastOrderDate || lastOrderedQuantity <= 0) continue;

    const treatmentsSince = visits.filter(
      (v) => v.treatmentType === mapping.treatmentType && v.visitDate && v.visitDate.toDate() > lastOrderDate!
    );
    const consumedSinceLastOrder = treatmentsSince.length * mapping.quantityPerTreatment;

    if (consumedSinceLastOrder >= lastOrderedQuantity) due.push(mapping);
  }

  return due;
}

/**
 * Runs once a day. Orders stay per-doctor even inside a medical center
 * (see UserProfile.clinicOwnerId's doc comment), so this iterates every
 * doctor individually for the order side while caching the shared
 * visits-per-clinic side (several center doctors reuse the same fetch).
 */
export const sendReorderReminders = onSchedule(
  { schedule: "0 8 * * *", timeZone: "Asia/Jerusalem" },
  async () => {
    const mappingsSnap = await db.collection(Paths.consumptionMappings).get();
    if (mappingsSnap.empty) return;
    const mappings = mappingsSnap.docs.map((d) => d.data() as ConsumptionMapping);

    const doctorsSnap = await db.collection(Paths.users).where("role", "==", Roles.doctor).get();
    if (doctorsSnap.empty) return;

    const visitsCache = new Map<string, Promise<Visit[]>>();
    const getVisits = (ownerId: string, ownerType: string): Promise<Visit[]> => {
      const key = `${ownerType}:${ownerId}`;
      if (!visitsCache.has(key)) {
        visitsCache.set(
          key,
          db
            .collection(Paths.visits)
            .where("ownerId", "==", ownerId)
            .where("ownerType", "==", ownerType)
            .get()
            .then((snap) => snap.docs.map((d) => d.data() as Visit))
        );
      }
      return visitsCache.get(key)!;
    };

    await Promise.all(
      doctorsSnap.docs.map(async (doctorDoc) => {
        const doctor = doctorDoc.data();
        const ownerId = (doctor.centerId as string | undefined) ?? doctorDoc.id;
        const ownerType = doctor.centerId ? "center" : "doctor";

        const [visits, ordersSnap] = await Promise.all([
          getVisits(ownerId, ownerType),
          db.collection(Paths.orders).where("doctorId", "==", doctorDoc.id).get(),
        ]);
        const orders = ordersSnap.docs.map((d) => d.data() as { createdAt?: Timestamp; items: OrderItem[] });

        const due = computeDueMappings(mappings, visits, orders);
        if (due.length === 0) return;

        const names = due.slice(0, 3).map((m) => `${m.productName} (${m.variantLabel})`);
        const suffix = due.length > 3 ? ` و${due.length - 3} أخرى` : "";
        await notifyUser(
          doctorDoc.id,
          "منتجات قاربت على النفاد",
          `بناءً على استخدامك: ${names.join("، ")}${suffix}`,
          { type: "reorder_reminder" }
        );
      })
    );
  }
);
