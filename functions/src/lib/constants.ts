// Mirrors lib/core/constants/firestore_paths.dart on the Flutter side —
// keep both in sync if a collection/field name ever changes.
export const Paths = {
  users: "users",
  products: "products",
  variants: "variants",
  costs: "costs",
  orders: "orders",
  payments: "payments",
  profitData: "profitData",
  profitDataSummaryDoc: "summary",
  activityLog: "activityLog",
  stats: "stats",
  statsGlobalDoc: "global",
  monthlyProfit: "monthlyProfit",
  offers: "offers",
  accountRequests: "accountRequests",
  medicalCenters: "medicalCenters",
  patients: "patients",
  visits: "visits",
  clinicStats: "clinicStats",
  appointments: "appointments",
  expenses: "expenses",
  expenseTemplates: "expenseTemplates",
  patientPayments: "patientPayments",
  toothPhotos: "toothPhotos",
  consumptionMappings: "consumptionMappings",
} as const;

export const Roles = {
  admin: "admin",
  doctor: "doctor",
} as const;

export const OrderStatus = {
  waiting: "waiting",
  inProgress: "in_progress",
  completed: "completed",
  cancelled: "cancelled",
} as const;

export const PaymentStatus = {
  paid: "paid",
  partial: "partial",
  unpaid: "unpaid",
} as const;

export const AppointmentStatus = {
  scheduled: "scheduled",
  completed: "completed",
  cancelled: "cancelled",
  noShow: "no_show",
} as const;

export const ActivityType = {
  orderCreated: "order_created",
  orderStatusChanged: "order_status_changed",
  paymentRecorded: "payment_recorded",
  productAdded: "product_added",
  productEdited: "product_edited",
  stockLow: "stock_low",
  stockOut: "stock_out",
  tierUpgraded: "tier_upgraded",
} as const;

// A doctor's loyalty tier. Never persisted as a doctor's "current" value —
// always recomputed live from this calendar year's orders (see tiers.ts).
export const Tiers = {
  silver: "silver",
  gold: "gold",
  platinum: "platinum",
} as const;

// Who a patient/visit/payment belongs to — see lib/models/patient.dart
// PatientOwnerType. ownerId is a doctorId for 'doctor', a centerId for
// 'center'.
export const OwnerType = {
  doctor: "doctor",
  center: "center",
} as const;

export const ADMIN_ALERTS_TOPIC = "admin_alerts";

/** "YYYY-MM" key for the given date, in UTC — matches how the Flutter side
 * reads stats/global/monthlyProfit/{YYYY-MM} document IDs. */
export function monthKeyFor(date: Date): string {
  const year = date.getUTCFullYear();
  const month = String(date.getUTCMonth() + 1).padStart(2, "0");
  return `${year}-${month}`;
}
