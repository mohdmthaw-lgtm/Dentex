import 'package:cloud_firestore/cloud_firestore.dart' hide Order;

import '../../core/constants/firestore_paths.dart';
import '../../models/order.dart';

/// Cart line the UI builds up before submitting an order (admin manual
/// entry or doctor self-service) — resolved into a snapshot [OrderItem]
/// only at submit time.
class CartLine {
  const CartLine({
    required this.productId,
    required this.productName,
    required this.variantId,
    required this.variantLabel,
    required this.unitSellPrice,
    required this.quantity,
    this.offerId,
    this.offerName,
  });

  final String productId;
  final String productName;
  final String variantId;
  final String variantLabel;
  final num unitSellPrice;
  final int quantity;
  final String? offerId;
  final String? offerName;

  num get lineTotal => unitSellPrice * quantity;
}

/// Order creation/mutation is intentionally light on the client: the heavy
/// lifting (stock decrement, profit snapshot, stats aggregation,
/// notifications) happens server-side in the onOrderCreated /
/// onOrderUpdated / onPaymentCreated Cloud Functions triggers, so the
/// client only ever writes the initiating document and lets triggers
/// reconcile everything else via FieldValue.increment — never a
/// read-modify-write race from two admin sessions editing at once.
class OrderRepository {
  OrderRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _orders =>
      _db.collection(FirestorePaths.orders);

  Stream<List<Order>> watchOrders({String? status}) {
    Query<Map<String, dynamic>> query =
        _orders.orderBy('createdAt', descending: true);
    if (status != null) {
      query = query.where('status', isEqualTo: status);
    }
    return query.snapshots().map(
        (snap) => snap.docs.map((d) => Order.fromDoc(d.id, d.data())).toList());
  }

  Stream<List<Order>> watchOrdersForDoctor(String doctorId) {
    return _orders
        .where('doctorId', isEqualTo: doctorId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => Order.fromDoc(d.id, d.data())).toList());
  }

  /// One-shot equivalent of [watchOrdersForDoctor] — used right before
  /// submitting a new order, to compute the doctor's current loyalty-tier
  /// standing (see computeDoctorTierInfo) without holding a live listener
  /// open just for that.
  Future<List<Order>> getOrdersForDoctor(String doctorId) async {
    final snap = await _orders
        .where('doctorId', isEqualTo: doctorId)
        .orderBy('createdAt', descending: true)
        .get();
    return snap.docs.map((d) => Order.fromDoc(d.id, d.data())).toList();
  }

  Stream<List<Order>> watchHighestValueOrders({int limit = 10}) {
    return _orders
        .orderBy('totalAmount', descending: true)
        .limit(limit)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => Order.fromDoc(d.id, d.data())).toList());
  }

  Future<Order?> getOrder(String orderId) async {
    final doc = await _orders.doc(orderId).get();
    if (!doc.exists) return null;
    return Order.fromDoc(doc.id, doc.data()!);
  }

  Stream<Order?> watchOrder(String orderId) {
    return _orders
        .doc(orderId)
        .snapshots()
        .map((doc) => doc.exists ? Order.fromDoc(doc.id, doc.data()!) : null);
  }

  /// Creates an order. `createdBy` distinguishes an admin manually keying in
  /// a phone/visit order from a doctor submitting through their own app —
  /// both land in the same collection and list.
  Future<String> createOrder({
    required String doctorId,
    required String doctorNameSnapshot,
    required String doctorPhoneSnapshot,
    required String createdBy,
    required String createdByUid,
    required List<CartLine> items,
    required num amountPaidNow,
    String notes = '',
    // The doctor's loyalty-tier discount rate (0, 0.05, 0.10 — see
    // computeDoctorTierInfo/tierDiscounts), applied uniformly to the
    // subtotal. Centralized here so the admin and doctor order-creation
    // flows can never compute it differently.
    num discountRate = 0,
  }) async {
    final orderItems = items
        .map((c) => {
              'productId': c.productId,
              'productName': c.productName,
              'variantId': c.variantId,
              'variantLabel': c.variantLabel,
              'unitSellPrice': c.unitSellPrice,
              'quantity': c.quantity,
              'lineTotal': c.lineTotal,
              if (c.offerId != null) 'offerId': c.offerId,
              if (c.offerName != null) 'offerName': c.offerName,
            })
        .toList();
    final subtotalAmount =
        items.fold<num>(0, (total, c) => total + c.lineTotal);
    final discountAmount = subtotalAmount * discountRate;
    final totalAmount = subtotalAmount - discountAmount;

    final orderRef = _orders.doc();
    await orderRef.set({
      'doctorId': doctorId,
      'doctorNameSnapshot': doctorNameSnapshot,
      'doctorPhoneSnapshot': doctorPhoneSnapshot,
      'createdBy': createdBy,
      'createdByUid': createdByUid,
      'status': OrderStatus.waiting,
      'items': orderItems,
      'subtotalAmount': subtotalAmount,
      'discountRate': discountRate,
      'discountAmount': discountAmount,
      'totalAmount': totalAmount,
      'amountPaid': 0, // the payments subcollection write below is the
      'amountRemaining': totalAmount, // source of truth; onPaymentCreated
      'paymentStatus': PaymentStatus.unpaid, // reconciles these two fields.
      'notes': notes,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      'completedAt': null,
    });

    if (amountPaidNow > 0) {
      await recordPayment(
        orderId: orderRef.id,
        amount: amountPaidNow,
        recordedByUid: createdByUid,
      );
    }

    return orderRef.id;
  }

  Future<void> updateStatus({
    required String orderId,
    required String status,
  }) {
    return _orders.doc(orderId).update({
      'status': status,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> recordPayment({
    required String orderId,
    required num amount,
    required String recordedByUid,
    String note = '',
  }) {
    final paymentRef =
        _orders.doc(orderId).collection(FirestorePaths.payments).doc();
    return paymentRef.set({
      'amount': amount,
      'method': 'cash',
      'recordedByUid': recordedByUid,
      'recordedAt': FieldValue.serverTimestamp(),
      'note': note,
    });
  }

  Stream<List<Payment>> watchPayments(String orderId) {
    return _orders
        .doc(orderId)
        .collection(FirestorePaths.payments)
        .orderBy('recordedAt', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => Payment.fromDoc(d.id, d.data())).toList());
  }
}
