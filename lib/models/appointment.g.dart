// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Appointment _$AppointmentFromJson(Map<String, dynamic> json) => _Appointment(
  id: json['id'] as String,
  ownerId: json['ownerId'] as String,
  ownerType: json['ownerType'] as String? ?? PatientOwnerType.doctor,
  patientId: json['patientId'] as String,
  patientNameSnapshot: json['patientNameSnapshot'] as String,
  scheduledAt: const TimestampConverter().fromJson(json['scheduledAt']),
  expectedTreatmentType:
      json['expectedTreatmentType'] as String? ?? TreatmentType.other,
  status: json['status'] as String? ?? AppointmentStatus.scheduled,
  notes: json['notes'] as String? ?? '',
  createdByUid: json['createdByUid'] as String,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  assignedDoctorUid: json['assignedDoctorUid'] as String?,
  reminderSent: json['reminderSent'] as bool? ?? false,
);

Map<String, dynamic> _$AppointmentToJson(_Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'ownerType': instance.ownerType,
      'patientId': instance.patientId,
      'patientNameSnapshot': instance.patientNameSnapshot,
      'scheduledAt': const TimestampConverter().toJson(instance.scheduledAt),
      'expectedTreatmentType': instance.expectedTreatmentType,
      'status': instance.status,
      'notes': instance.notes,
      'createdByUid': instance.createdByUid,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'assignedDoctorUid': instance.assignedDoctorUid,
      'reminderSent': instance.reminderSent,
    };
