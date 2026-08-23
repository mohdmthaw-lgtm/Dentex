// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tooth_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToothPhoto _$ToothPhotoFromJson(Map<String, dynamic> json) => _ToothPhoto(
  id: json['id'] as String,
  ownerId: json['ownerId'] as String,
  ownerType: json['ownerType'] as String? ?? PatientOwnerType.doctor,
  patientId: json['patientId'] as String,
  toothNumber: json['toothNumber'] as String,
  visitId: json['visitId'] as String,
  category: json['category'] as String? ?? ToothPhotoCategory.before,
  storageUrl: json['storageUrl'] as String,
  storagePath: json['storagePath'] as String,
  uploadedByUid: json['uploadedByUid'] as String,
  uploadedAt: const TimestampConverter().fromJson(json['uploadedAt']),
);

Map<String, dynamic> _$ToothPhotoToJson(_ToothPhoto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'ownerType': instance.ownerType,
      'patientId': instance.patientId,
      'toothNumber': instance.toothNumber,
      'visitId': instance.visitId,
      'category': instance.category,
      'storageUrl': instance.storageUrl,
      'storagePath': instance.storagePath,
      'uploadedByUid': instance.uploadedByUid,
      'uploadedAt': const TimestampConverter().toJson(instance.uploadedAt),
    };
