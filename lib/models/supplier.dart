import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'supplier.freezed.dart';
part 'supplier.g.dart';

/// A shared registry of company names used both as a shipment's
/// exporter/freight supplier and as a shipment item's manufacturer — one
/// list, picked independently per field (see Shipment doc comment).
@freezed
class Supplier with _$Supplier {
  const factory Supplier({
    required String id,
    required String name,
    @TimestampConverter() DateTime? createdAt,
  }) = _Supplier;

  factory Supplier.fromJson(Map<String, dynamic> json) =>
      _$SupplierFromJson(json);

  factory Supplier.fromDoc(String id, Map<String, dynamic> data) =>
      Supplier.fromJson({...data, 'id': id});
}
