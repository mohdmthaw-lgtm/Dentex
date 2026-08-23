// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Supplier _$SupplierFromJson(Map<String, dynamic> json) => _Supplier(
  id: json['id'] as String,
  name: json['name'] as String,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$SupplierToJson(_Supplier instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};
