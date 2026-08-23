// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsumptionMapping _$ConsumptionMappingFromJson(Map<String, dynamic> json) =>
    _ConsumptionMapping(
      id: json['id'] as String,
      treatmentType: json['treatmentType'] as String,
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      variantId: json['variantId'] as String,
      variantLabel: json['variantLabel'] as String,
      quantityPerTreatment: json['quantityPerTreatment'] as num? ?? 1,
      createdByUid: json['createdByUid'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$ConsumptionMappingToJson(_ConsumptionMapping instance) =>
    <String, dynamic>{
      'id': instance.id,
      'treatmentType': instance.treatmentType,
      'productId': instance.productId,
      'productName': instance.productName,
      'variantId': instance.variantId,
      'variantLabel': instance.variantLabel,
      'quantityPerTreatment': instance.quantityPerTreatment,
      'createdByUid': instance.createdByUid,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
