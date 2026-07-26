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

export const ActivityType = {
  orderCreated: "order_created",
  orderStatusChanged: "order_status_changed",
  paymentRecorded: "payment_recorded",
  productAdded: "product_added",
  productEdited: "product_edited",
  stockLow: "stock_low",
  stockOut: "stock_out",
} as const;

export const ADMIN_ALERTS_TOPIC = "admin_alerts";

/** "YYYY-MM" key for the given date, in UTC — matches how the Flutter side
 * reads stats/global/monthlyProfit/{YYYY-MM} document IDs. */
export function monthKeyFor(date: Date): string {
  const year = date.getUTCFullYear();
  const month = String(date.getUTCMonth() + 1).padStart(2, "0");
  return `${year}-${month}`;
}
