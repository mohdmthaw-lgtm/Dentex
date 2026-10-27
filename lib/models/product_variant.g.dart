// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductVariant _$ProductVariantFromJson(Map<String, dynamic> json) =>
    _ProductVariant(
      id: json['id'] as String,
      label: json['label'] as String,
      sellPrice: json['sellPrice'] as num,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      totalSold: (json['totalSold'] as num?)?.toInt() ?? 0,
      imageUrl: json['imageUrl'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      diameterMm: json['diameterMm'] as num?,
      totalLengthMm: json['totalLengthMm'] as num?,
      roughness: json['roughness'] as String? ?? '',
      productName: json['productName'] as String? ?? '',
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$ProductVariantToJson(_ProductVariant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'sellPrice': instance.sellPrice,
      'quantity': instance.quantity,
      'totalSold': instance.totalSold,
      'imageUrl': instance.imageUrl,
      'imagePath': instance.imagePath,
      'diameterMm': instance.diameterMm,
      'totalLengthMm': instance.totalLengthMm,
      'roughness': instance.roughness,
      'productName': instance.productName,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

_VariantSummary _$VariantSummaryFromJson(Map<String, dynamic> json) =>
    _VariantSummary(
      variantId: json['variantId'] as String,
      label: json['label'] as String,
      sellPrice: json['sellPrice'] as num,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      diameterMm: json['diameterMm'] as num?,
      totalLengthMm: json['totalLengthMm'] as num?,
      roughness: json['roughness'] as String? ?? '',
    );

Map<String, dynamic> _$VariantSummaryToJson(_VariantSummary instance) =>
    <String, dynamic>{
      'variantId': instance.variantId,
      'label': instance.label,
      'sellPrice': instance.sellPrice,
      'quantity': instance.quantity,
      'diameterMm': instance.diameterMm,
      'totalLengthMm': instance.totalLengthMm,
      'roughness': instance.roughness,
    };

_ProductVariantCost _$ProductVariantCostFromJson(Map<String, dynamic> json) =>
    _ProductVariantCost(costPrice: json['costPrice'] as num);

Map<String, dynamic> _$ProductVariantCostToJson(_ProductVariantCost instance) =>
    <String, dynamic>{'costPrice': instance.costPrice};
