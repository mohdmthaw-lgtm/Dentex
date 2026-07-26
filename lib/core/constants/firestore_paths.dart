/// Central collection/document name constants for Firestore paths.
/// Referencing these instead of raw strings keeps every service/screen
/// in sync if a collection is ever renamed.
class FirestorePaths {
  FirestorePaths._();

  static const users = 'users';
  static const products = 'products';
  static const variants = 'variants';
  static const costs = 'costs';
  static const orders = 'orders';
  static const payments = 'payments';
  static const profitData = 'profitData';
  static const profitDataSummaryDoc = 'summary';
  static const activityLog = 'activityLog';
  static const stats = 'stats';
  static const statsGlobalDoc = 'global';
  static const monthlyProfit = 'monthlyProfit';
  static const offers = 'offers';
}

class AppRoles {
  AppRoles._();

  static const admin = 'admin';
  static const doctor = 'doctor';
}

class OrderStatus {
  OrderStatus._();

  static const waiting = 'waiting';
  static const inProgress = 'in_progress';
  static const completed = 'completed';
  static const cancelled = 'cancelled';

  static const all = [waiting, inProgress, completed, cancelled];
}

class PaymentStatus {
  PaymentStatus._();

  static const paid = 'paid';
  static const partial = 'partial';
  static const unpaid = 'unpaid';
}

class ActivityType {
  ActivityType._();

  static const orderCreated = 'order_created';
  static const orderStatusChanged = 'order_status_changed';
  static const paymentRecorded = 'payment_recorded';
  static const productAdded = 'product_added';
  static const productEdited = 'product_edited';
  static const stockLow = 'stock_low';
  static const stockOut = 'stock_out';
}
