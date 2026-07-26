// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShipmentItemImpl _$$ShipmentItemImplFromJson(Map<String, dynamic> json) =>
    _$ShipmentItemImpl(
      productName: json['productName'] as String,
      manufacturer: json['manufacturer'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      cartonCount: (json['cartonCount'] as num?)?.toInt() ?? 0,
      purchasePrice: json['purchasePrice'] as num? ?? 0,
    );

Map<String, dynamic> _$$ShipmentItemImplToJson(_$ShipmentItemImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'manufacturer': instance.manufacturer,
      'quantity': instance.quantity,
      'cartonCount': instance.cartonCount,
      'purchasePrice': instance.purchasePrice,
    };

_$ShipmentCostsImpl _$$ShipmentCostsImplFromJson(Map<String, dynamic> json) =>
    _$ShipmentCostsImpl(
      shipping: json['shipping'] as num? ?? 0,
      customs: json['customs'] as num? ?? 0,
      clearance: json['clearance'] as num? ?? 0,
      storage: json['storage'] as num? ?? 0,
      transport: json['transport'] as num? ?? 0,
      other: json['other'] as num? ?? 0,
    );

Map<String, dynamic> _$$ShipmentCostsImplToJson(_$ShipmentCostsImpl instance) =>
    <String, dynamic>{
      'shipping': instance.shipping,
      'customs': instance.customs,
      'clearance': instance.clearance,
      'storage': instance.storage,
      'transport': instance.transport,
      'other': instance.other,
    };

_$ShipmentDocumentImpl _$$ShipmentDocumentImplFromJson(
        Map<String, dynamic> json) =>
    _$ShipmentDocumentImpl(
      label: json['label'] as String,
      url: json['url'] as String,
      path: json['path'] as String,
      uploadedAt: const TimestampConverter().fromJson(json['uploadedAt']),
    );

Map<String, dynamic> _$$ShipmentDocumentImplToJson(
        _$ShipmentDocumentImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'url': instance.url,
      'path': instance.path,
      'uploadedAt': const TimestampConverter().toJson(instance.uploadedAt),
    };

_$ShipmentImpl _$$ShipmentImplFromJson(Map<String, dynamic> json) =>
    _$ShipmentImpl(
      id: json['id'] as String,
      shipmentNumber: json['shipmentNumber'] as String,
      supplierName: json['supplierName'] as String? ?? '',
      purchaseOrderNumber: json['purchaseOrderNumber'] as String? ?? '',
      shippingCompany: json['shippingCompany'] as String? ?? '',
      shippingAgent: json['shippingAgent'] as String? ?? '',
      shipmentType: json['shipmentType'] as String? ?? ShipmentType.sea,
      originCountry: json['originCountry'] as String? ?? '',
      containerNumber: json['containerNumber'] as String? ?? '',
      shipDate: const NullableTimestampConverter().fromJson(json['shipDate']),
      expectedArrivalDate: const NullableTimestampConverter()
          .fromJson(json['expectedArrivalDate']),
      notes: json['notes'] as String? ?? '',
      status: json['status'] as String? ?? ShipmentStatus.preparing,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ShipmentItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ShipmentItem>[],
      costs: json['costs'] == null
          ? const ShipmentCosts()
          : ShipmentCosts.fromJson(json['costs'] as Map<String, dynamic>),
      currency: json['currency'] as String? ?? 'USD',
      documents: (json['documents'] as List<dynamic>?)
              ?.map((e) => ShipmentDocument.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ShipmentDocument>[],
      receivedAt:
          const NullableTimestampConverter().fromJson(json['receivedAt']),
      receivedCartons: (json['receivedCartons'] as num?)?.toInt() ?? 0,
      receivingNotes: json['receivingNotes'] as String? ?? '',
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$ShipmentImplToJson(_$ShipmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shipmentNumber': instance.shipmentNumber,
      'supplierName': instance.supplierName,
      'purchaseOrderNumber': instance.purchaseOrderNumber,
      'shippingCompany': instance.shippingCompany,
      'shippingAgent': instance.shippingAgent,
      'shipmentType': instance.shipmentType,
      'originCountry': instance.originCountry,
      'containerNumber': instance.containerNumber,
      'shipDate': const NullableTimestampConverter().toJson(instance.shipDate),
      'expectedArrivalDate': const NullableTimestampConverter()
          .toJson(instance.expectedArrivalDate),
      'notes': instance.notes,
      'status': instance.status,
      'items': instance.items,
      'costs': instance.costs,
      'currency': instance.currency,
      'documents': instance.documents,
      'receivedAt':
          const NullableTimestampConverter().toJson(instance.receivedAt),
      'receivedCartons': instance.receivedCartons,
      'receivingNotes': instance.receivingNotes,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
