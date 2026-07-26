import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/constants/firestore_paths.dart';
import 'converters.dart';

part 'shipment.freezed.dart';
part 'shipment.g.dart';

/// One product line inside a shipment. `manufacturer` is deliberately
/// per-item (not inherited from the shipment's `supplierName`) — a single
/// shipment from one freight supplier/exporter routinely bundles goods
/// from several different factories.
@freezed
class ShipmentItem with _$ShipmentItem {
  const factory ShipmentItem({
    required String productName,
    @Default('') String manufacturer,
    @Default(0) int quantity,
    @Default(0) int cartonCount,
    @Default(0) num purchasePrice,
  }) = _ShipmentItem;

  const ShipmentItem._();

  factory ShipmentItem.fromJson(Map<String, dynamic> json) =>
      _$ShipmentItemFromJson(json);

  num get lineTotal => purchasePrice * quantity;
}

@freezed
class ShipmentCosts with _$ShipmentCosts {
  const factory ShipmentCosts({
    @Default(0) num shipping,
    @Default(0) num customs,
    @Default(0) num clearance,
    @Default(0) num storage,
    @Default(0) num transport,
    @Default(0) num other,
  }) = _ShipmentCosts;

  const ShipmentCosts._();

  factory ShipmentCosts.fromJson(Map<String, dynamic> json) =>
      _$ShipmentCostsFromJson(json);

  num get total => shipping + customs + clearance + storage + transport + other;
}

@freezed
class ShipmentDocument with _$ShipmentDocument {
  const factory ShipmentDocument({
    required String label,
    required String url,
    required String path,
    @TimestampConverter() DateTime? uploadedAt,
  }) = _ShipmentDocument;

  factory ShipmentDocument.fromJson(Map<String, dynamic> json) =>
      _$ShipmentDocumentFromJson(json);
}

/// A tracked import shipment, from prep through receiving. Deliberately
/// admin-only (never doctor-facing) — costs/supplier terms are internal
/// business data.
@freezed
class Shipment with _$Shipment {
  const factory Shipment({
    required String id,
    required String shipmentNumber,
    @Default('') String supplierName,
    @Default('') String purchaseOrderNumber,
    @Default('') String shippingCompany,
    @Default('') String shippingAgent,
    @Default(ShipmentType.sea) String shipmentType, // see ShipmentType consts
    @Default('') String originCountry,
    @Default('') String containerNumber,
    @NullableTimestampConverter() DateTime? shipDate,
    @NullableTimestampConverter() DateTime? expectedArrivalDate,
    @Default('') String notes,
    @Default(ShipmentStatus.preparing) String status, // see ShipmentStatus consts
    @Default(<ShipmentItem>[]) List<ShipmentItem> items,
    @Default(ShipmentCosts()) ShipmentCosts costs,
    @Default('USD') String currency, // 'USD' | 'ILS'
    @Default(<ShipmentDocument>[]) List<ShipmentDocument> documents,
    @NullableTimestampConverter() DateTime? receivedAt,
    @Default(0) int receivedCartons,
    @Default('') String receivingNotes,
    @TimestampConverter() DateTime? createdAt,
  }) = _Shipment;

  const Shipment._();

  factory Shipment.fromJson(Map<String, dynamic> json) =>
      _$ShipmentFromJson(json);

  factory Shipment.fromDoc(String id, Map<String, dynamic> data) =>
      Shipment.fromJson({...data, 'id': id});

  num get productsTotal => items.fold<num>(0, (sum, i) => sum + i.lineTotal);
  int get totalQuantity => items.fold(0, (sum, i) => sum + i.quantity);
  int get totalCartons => items.fold(0, (sum, i) => sum + i.cartonCount);
  num get totalCost => productsTotal + costs.total;
}
