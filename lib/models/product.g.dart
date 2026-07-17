// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      lowStockThreshold: (json['lowStockThreshold'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      totalQuantity: (json['totalQuantity'] as num?)?.toInt() ?? 0,
      variantSummaries: (json['variantSummaries'] as List<dynamic>?)
              ?.map((e) => VariantSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <VariantSummary>[],
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'imagePath': instance.imagePath,
      'lowStockThreshold': instance.lowStockThreshold,
      'isActive': instance.isActive,
      'totalQuantity': instance.totalQuantity,
      'variantSummaries': instance.variantSummaries,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
