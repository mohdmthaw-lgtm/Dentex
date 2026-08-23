// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityLogEntry _$ActivityLogEntryFromJson(Map<String, dynamic> json) =>
    _ActivityLogEntry(
      id: json['id'] as String,
      type: json['type'] as String,
      actorUid: json['actorUid'] as String,
      actorName: json['actorName'] as String,
      actorRole: json['actorRole'] as String,
      message: json['message'] as String,
      relatedOrderId: json['relatedOrderId'] as String?,
      relatedProductId: json['relatedProductId'] as String?,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$ActivityLogEntryToJson(_ActivityLogEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'actorUid': instance.actorUid,
      'actorName': instance.actorName,
      'actorRole': instance.actorRole,
      'message': instance.message,
      'relatedOrderId': instance.relatedOrderId,
      'relatedProductId': instance.relatedProductId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
