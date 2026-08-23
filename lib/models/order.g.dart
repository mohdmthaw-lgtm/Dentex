// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
  productId: json['productId'] as String,
  productName: json['productName'] as String,
  productImageUrl: json['productImageUrl'] as String? ?? '',
  variantId: json['variantId'] as String,
  variantLabel: json['variantLabel'] as String,
  unitSellPrice: json['unitSellPrice'] as num,
  quantity: (json['quantity'] as num).toInt(),
  lineTotal: json['lineTotal'] as num,
  offerId: json['offerId'] as String?,
  offerName: json['offerName'] as String?,
);

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productImageUrl': instance.productImageUrl,
      'variantId': instance.variantId,
      'variantLabel': instance.variantLabel,
      'unitSellPrice': instance.unitSellPrice,
      'quantity': instance.quantity,
      'lineTotal': instance.lineTotal,
      'offerId': instance.offerId,
      'offerName': instance.offerName,
    };

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String,
  doctorId: json['doctorId'] as String,
  doctorNameSnapshot: json['doctorNameSnapshot'] as String,
  doctorPhoneSnapshot: json['doctorPhoneSnapshot'] as String? ?? '',
  createdBy: json['createdBy'] as String,
  createdByUid: json['createdByUid'] as String,
  status: json['status'] as String? ?? 'waiting',
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OrderItem>[],
  subtotalAmount: json['subtotalAmount'] as num? ?? 0,
  discountRate: json['discountRate'] as num? ?? 0,
  discountAmount: json['discountAmount'] as num? ?? 0,
  totalAmount: json['totalAmount'] as num? ?? 0,
  amountPaid: json['amountPaid'] as num? ?? 0,
  amountRemaining: json['amountRemaining'] as num? ?? 0,
  paymentStatus: json['paymentStatus'] as String? ?? 'unpaid',
  notes: json['notes'] as String? ?? '',
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
  completedAt: const NullableTimestampConverter().fromJson(json['completedAt']),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'doctorId': instance.doctorId,
  'doctorNameSnapshot': instance.doctorNameSnapshot,
  'doctorPhoneSnapshot': instance.doctorPhoneSnapshot,
  'createdBy': instance.createdBy,
  'createdByUid': instance.createdByUid,
  'status': instance.status,
  'items': instance.items,
  'subtotalAmount': instance.subtotalAmount,
  'discountRate': instance.discountRate,
  'discountAmount': instance.discountAmount,
  'totalAmount': instance.totalAmount,
  'amountPaid': instance.amountPaid,
  'amountRemaining': instance.amountRemaining,
  'paymentStatus': instance.paymentStatus,
  'notes': instance.notes,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
  'completedAt': const NullableTimestampConverter().toJson(
    instance.completedAt,
  ),
};

_Payment _$PaymentFromJson(Map<String, dynamic> json) => _Payment(
  id: json['id'] as String,
  amount: json['amount'] as num,
  method: json['method'] as String? ?? 'cash',
  recordedByUid: json['recordedByUid'] as String,
  recordedAt: const TimestampConverter().fromJson(json['recordedAt']),
  note: json['note'] as String? ?? '',
);

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'method': instance.method,
  'recordedByUid': instance.recordedByUid,
  'recordedAt': const TimestampConverter().toJson(instance.recordedAt),
  'note': instance.note,
};

_ProfitDataSummary _$ProfitDataSummaryFromJson(Map<String, dynamic> json) =>
    _ProfitDataSummary(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ProfitLineItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProfitLineItem>[],
      totalCost: json['totalCost'] as num? ?? 0,
      totalProfit: json['totalProfit'] as num? ?? 0,
    );

Map<String, dynamic> _$ProfitDataSummaryToJson(_ProfitDataSummary instance) =>
    <String, dynamic>{
      'items': instance.items,
      'totalCost': instance.totalCost,
      'totalProfit': instance.totalProfit,
    };

_ProfitLineItem _$ProfitLineItemFromJson(Map<String, dynamic> json) =>
    _ProfitLineItem(
      variantId: json['variantId'] as String,
      unitCostPrice: json['unitCostPrice'] as num,
      lineProfit: json['lineProfit'] as num,
    );

Map<String, dynamic> _$ProfitLineItemToJson(_ProfitLineItem instance) =>
    <String, dynamic>{
      'variantId': instance.variantId,
      'unitCostPrice': instance.unitCostPrice,
      'lineProfit': instance.lineProfit,
    };
