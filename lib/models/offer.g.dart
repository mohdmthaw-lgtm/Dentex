// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferItemImpl _$$OfferItemImplFromJson(Map<String, dynamic> json) =>
    _$OfferItemImpl(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      variantId: json['variantId'] as String,
      variantLabel: json['variantLabel'] as String,
      unitPrice: json['unitPrice'] as num,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$OfferItemImplToJson(_$OfferItemImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'variantId': instance.variantId,
      'variantLabel': instance.variantLabel,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
    };

_$OfferImpl _$$OfferImplFromJson(Map<String, dynamic> json) => _$OfferImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => OfferItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <OfferItem>[],
      offerPrice: json['offerPrice'] as num? ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      startDate: const NullableTimestampConverter().fromJson(json['startDate']),
      endDate: const NullableTimestampConverter().fromJson(json['endDate']),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      timesSold: (json['timesSold'] as num?)?.toInt() ?? 0,
      unitsSold: (json['unitsSold'] as num?)?.toInt() ?? 0,
      totalRevenue: json['totalRevenue'] as num? ?? 0,
      totalDiscountGiven: json['totalDiscountGiven'] as num? ?? 0,
    );

Map<String, dynamic> _$$OfferImplToJson(_$OfferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'imagePath': instance.imagePath,
      'items': instance.items,
      'offerPrice': instance.offerPrice,
      'isActive': instance.isActive,
      'startDate':
          const NullableTimestampConverter().toJson(instance.startDate),
      'endDate': const NullableTimestampConverter().toJson(instance.endDate),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'timesSold': instance.timesSold,
      'unitsSold': instance.unitsSold,
      'totalRevenue': instance.totalRevenue,
      'totalDiscountGiven': instance.totalDiscountGiven,
    };
