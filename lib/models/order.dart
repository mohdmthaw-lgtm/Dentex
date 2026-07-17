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
