// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountRequestImpl _$$AccountRequestImplFromJson(Map<String, dynamic> json) =>
    _$AccountRequestImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String? ?? '',
      clinicName: json['clinicName'] as String? ?? '',
      location: json['location'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      status: json['status'] as String? ?? AccountRequestStatus.pending,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$AccountRequestImplToJson(
        _$AccountRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'clinicName': instance.clinicName,
      'location': instance.location,
      'notes': instance.notes,
      'status': instance.status,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
