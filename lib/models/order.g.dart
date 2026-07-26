// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      variantId: json['variantId'] as String,
      variantLabel: json['variantLabel'] as String,
      unitSellPrice: json['unitSellPrice'] as num,
      quantity: (json['quantity'] as num).toInt(),
      lineTotal: json['lineTotal'] as num,
      offerId: json['offerId'] as String?,
      offerName: json['offerName'] as String?,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'variantId': instance.variantId,
      'variantLabel': instance.variantLabel,
      'unitSellPrice': instance.unitSellPrice,
      'quantity': instance.quantity,
      'lineTotal': instance.lineTotal,
      'offerId': instance.offerId,
      'offerName': instance.offerName,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      doctorId: json['doctorId'] as String,
      doctorNameSnapshot: json['doctorNameSnapshot'] as String,
      doctorPhoneSnapshot: json['doctorPhoneSnapshot'] as String? ?? '',
      createdBy: json['createdBy'] as String,
      createdByUid: json['createdByUid'] as String,
      status: json['status'] as String? ?? 'waiting',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <OrderItem>[],
      totalAmount: json['totalAmount'] as num? ?? 0,
      amountPaid: json['amountPaid'] as num? ?? 0,
      amountRemaining: json['amountRemaining'] as num? ?? 0,
      paymentStatus: json['paymentStatus'] as String? ?? 'unpaid',
      notes: json['notes'] as String? ?? '',
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
      completedAt:
          const NullableTimestampConverter().fromJson(json['completedAt']),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorId': instance.doctorId,
      'doctorNameSnapshot': instance.doctorNameSnapshot,
      'doctorPhoneSnapshot': instance.doctorPhoneSnapshot,
      'createdBy': instance.createdBy,
      'createdByUid': instance.createdByUid,
      'status': instance.status,
      'items': instance.items,
      'totalAmount': instance.totalAmount,
      'amountPaid': instance.amountPaid,
      'amountRemaining': instance.amountRemaining,
      'paymentStatus': instance.paymentStatus,
      'notes': instance.notes,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'completedAt':
          const NullableTimestampConverter().toJson(instance.completedAt),
    };

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: json['id'] as String,
      amount: json['amount'] as num,
      method: json['method'] as String? ?? 'cash',
      recordedByUid: json['recordedByUid'] as String,
      recordedAt: const TimestampConverter().fromJson(json['recordedAt']),
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'method': instance.method,
      'recordedByUid': instance.recordedByUid,
      'recordedAt': const TimestampConverter().toJson(instance.recordedAt),
      'note': instance.note,
    };

_$ProfitDataSummaryImpl _$$ProfitDataSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfitDataSummaryImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ProfitLineItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProfitLineItem>[],
      totalCost: json['totalCost'] as num? ?? 0,
      totalProfit: json['totalProfit'] as num? ?? 0,
    );

Map<String, dynamic> _$$ProfitDataSummaryImplToJson(
        _$ProfitDataSummaryImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'totalCost': instance.totalCost,
      'totalProfit': instance.totalProfit,
    };

_$ProfitLineItemImpl _$$ProfitLineItemImplFromJson(Map<String, dynamic> json) =>
    _$ProfitLineItemImpl(
      variantId: json['variantId'] as String,
      unitCostPrice: json['unitCostPrice'] as num,
      lineProfit: json['lineProfit'] as num,
    );

Map<String, dynamic> _$$ProfitLineItemImplToJson(
        _$ProfitLineItemImpl instance) =>
    <String, dynamic>{
      'variantId': instance.variantId,
      'unitCostPrice': instance.unitCostPrice,
      'lineProfit': instance.lineProfit,
    };
