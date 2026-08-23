// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_center.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedicalCenter _$MedicalCenterFromJson(Map<String, dynamic> json) =>
    _MedicalCenter(
      id: json['id'] as String,
      name: json['name'] as String,
      chairCount: (json['chairCount'] as num?)?.toInt() ?? 1,
      memberUids:
          (json['memberUids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      memberNames:
          (json['memberNames'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const <String, String>{},
      managerUid: json['managerUid'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$MedicalCenterToJson(_MedicalCenter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'chairCount': instance.chairCount,
      'memberUids': instance.memberUids,
      'memberNames': instance.memberNames,
      'managerUid': instance.managerUid,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
