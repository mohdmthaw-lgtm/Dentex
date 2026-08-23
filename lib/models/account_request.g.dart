// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountRequest _$AccountRequestFromJson(Map<String, dynamic> json) =>
    _AccountRequest(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String? ?? '',
      clinicName: json['clinicName'] as String? ?? '',
      location: json['location'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      status: json['status'] as String? ?? AccountRequestStatus.pending,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      accountType: json['accountType'] as String? ?? AccountRequestType.solo,
      centerName: json['centerName'] as String? ?? '',
      chairCount: (json['chairCount'] as num?)?.toInt() ?? 1,
      doctors:
          (json['doctors'] as List<dynamic>?)
              ?.map(
                (e) => AccountRequestDoctor.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <AccountRequestDoctor>[],
    );

Map<String, dynamic> _$AccountRequestToJson(_AccountRequest instance) =>
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
      'accountType': instance.accountType,
      'centerName': instance.centerName,
      'chairCount': instance.chairCount,
      'doctors': instance.doctors,
    };

_AccountRequestDoctor _$AccountRequestDoctorFromJson(
  Map<String, dynamic> json,
) => _AccountRequestDoctor(
  name: json['name'] as String,
  phone: json['phone'] as String,
  password: json['password'] as String,
  isManager: json['isManager'] as bool? ?? false,
);

Map<String, dynamic> _$AccountRequestDoctorToJson(
  _AccountRequestDoctor instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'password': instance.password,
  'isManager': instance.isManager,
};
