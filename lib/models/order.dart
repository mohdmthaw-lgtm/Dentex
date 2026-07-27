import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'order.freezed.dart';
part 'order.g.dart';

/// A snapshot of one product+variant at the moment an order was placed.
/// Fields are frozen at creation time so later price edits on the product
/// never retroactively change a historical order's total.
@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String productId,
    required String productName,
    required String variantId,
    required String variantLabel,
    required num unitSellPrice,
    required int quantity,
    required num lineTotal,
    // Set when this line came from an Offer/package rather than a
    // manually-picked product, so order/invoice UIs can group the package's
    // component lines under one heading instead of listing them flat.
    String? offerId,
    String? offerName,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String doctorId,
    required String doctorNameSnapshot,
    @Default('') String doctorPhoneSnapshot,
    required String createdBy, // 'admin' | 'doctor'
    required String createdByUid,
    @Default('waiting') String status,
    @Default(<OrderItem>[]) List<OrderItem> items,
    // Pre-discount sum of item lineTotals. Falls back to totalAmount for
    // orders placed before the loyalty-tier discount existed.
    @Default(0) num subtotalAmount,
    @Default(0) num discountRate,
    @Default(0) num discountAmount,
    @Default(0) num totalAmount,
    @Default(0) num amountPaid,
    @Default(0) num amountRemaining,
    @Default('unpaid') String paymentStatus,
    @Default('') String notes,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    @NullableTimestampConverter() DateTime? completedAt,
  }) = _Order;

  const Order._();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  factory Order.fromDoc(String id, Map<String, dynamic> data) =>
      Order.fromJson({...data, 'id': id});

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  /// Orders placed before the loyalty-tier discount existed never had
  /// `subtotalAmount` written (deserializes to 0) — fall back to
  /// `totalAmount` so old orders still display a sensible pre-discount price.
  num get displaySubtotal => subtotalAmount > 0 ? subtotalAmount : totalAmount;

  /// One line per distinct product, or per package (collapsed to its name)
  /// — for the truncated order-list preview text, so a multi-line package
  /// doesn't blow up a 2-line summary into a wall of component names.
  String get itemsSummary {
    final parts = <String>[];
    final seenOffers = <String>{};
    for (final item in items) {
      if (item.offerName != null) {
        if (seenOffers.add(item.offerName!)) parts.add('${item.offerName} (بكج)');
      } else {
        parts.add('${item.productName} (${item.variantLabel}) x${item.quantity}');
      }
    }
    return parts.join('، ');
  }

  /// Groups [items] by `offerId` so order/invoice UIs can show a package's
  /// component lines together under one heading instead of listing every
  /// line flat — items with no `offerId` each form their own single-item
  /// group, unaffected.
  List<OrderItemGroup> get itemGroups {
    final result = <OrderItemGroup>[];
    final offerIndex = <String, int>{};
    for (final item in items) {
      final offerId = item.offerId;
      if (offerId != null) {
        final idx = offerIndex[offerId];
        if (idx != null) {
          result[idx].items.add(item);
          continue;
        }
        offerIndex[offerId] = result.length;
      }
      result.add(OrderItemGroup(
        offerId: offerId,
        offerName: item.offerName,
        items: [item],
      ));
    }
    return result;
  }
}

/// Display-only grouping of [OrderItem]s that came from the same package
/// (see [Order.itemGroups]) — not persisted, derived fresh from `items`.
class OrderItemGroup {
  OrderItemGroup({this.offerId, this.offerName, required this.items});

  final String? offerId;
  final String? offerName;
  final List<OrderItem> items;

  num get lineTotal => items.fold<num>(0, (sum, item) => sum + item.lineTotal);
  int get quantity => items.fold(0, (sum, item) => sum + item.quantity);
}

/// orders/{orderId}/payments/{paymentId} — an append-only ledger. Multiple
/// partial/installment payments can land on one order over time; each gets
/// its own audit trail rather than editing a single amountPaid scalar in
/// place, so concurrent payment recording can never lose an update.
@freezed
class Payment with _$Payment {
  const factory Payment({
    required String id,
    required num amount,
    @Default('cash') String method,
    required String recordedByUid,
    @TimestampConverter() DateTime? recordedAt,
    @Default('') String note,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  factory Payment.fromDoc(String id, Map<String, dynamic> data) =>
      Payment.fromJson({...data, 'id': id});
}

/// orders/{orderId}/profitData/summary — admin-only. Split from the order
/// doc itself because Firestore rules can't hide individual fields within
/// one document; a doctor legitimately reads their own order (to see what
/// they owe) but must never see cost/profit.
@freezed
class ProfitDataSummary with _$ProfitDataSummary {
  const factory ProfitDataSummary({
    @Default(<ProfitLineItem>[]) List<ProfitLineItem> items,
    @Default(0) num totalCost,
    @Default(0) num totalProfit,
  }) = _ProfitDataSummary;

  factory ProfitDataSummary.fromJson(Map<String, dynamic> json) =>
      _$ProfitDataSummaryFromJson(json);
}

@freezed
class ProfitLineItem with _$ProfitLineItem {
  const factory ProfitLineItem({
    required String variantId,
    required num unitCostPrice,
    required num lineProfit,
  }) = _ProfitLineItem;

  factory ProfitLineItem.fromJson(Map<String, dynamic> json) =>
      _$ProfitLineItemFromJson(json);
}
