// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Patient _$PatientFromJson(Map<String, dynamic> json) => _Patient(
  id: json['id'] as String,
  ownerId: json['ownerId'] as String,
  ownerType: json['ownerType'] as String? ?? PatientOwnerType.doctor,
  name: json['name'] as String,
  phoneEncrypted: json['phoneEncrypted'] as String? ?? '',
  dob: const NullableTimestampConverter().fromJson(json['dob']),
  gender: json['gender'] as String? ?? '',
  address: json['address'] as String? ?? '',
  allergiesEncrypted: json['allergiesEncrypted'] as String? ?? '',
  chronicConditionsEncrypted:
      json['chronicConditionsEncrypted'] as String? ?? '',
  createdByUid: json['createdByUid'] as String,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
  stats: json['stats'] == null
      ? PatientStats.empty
      : PatientStats.fromJson(json['stats'] as Map<String, dynamic>),
  assignedDoctorUid: json['assignedDoctorUid'] as String?,
  assignedDoctorNameSnapshot: json['assignedDoctorNameSnapshot'] as String?,
);

Map<String, dynamic> _$PatientToJson(_Patient instance) => <String, dynamic>{
  'id': instance.id,
  'ownerId': instance.ownerId,
  'ownerType': instance.ownerType,
  'name': instance.name,
  'phoneEncrypted': instance.phoneEncrypted,
  'dob': const NullableTimestampConverter().toJson(instance.dob),
  'gender': instance.gender,
  'address': instance.address,
  'allergiesEncrypted': instance.allergiesEncrypted,
  'chronicConditionsEncrypted': instance.chronicConditionsEncrypted,
  'createdByUid': instance.createdByUid,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
  'stats': instance.stats,
  'assignedDoctorUid': instance.assignedDoctorUid,
  'assignedDoctorNameSnapshot': instance.assignedDoctorNameSnapshot,
};

_Visit _$VisitFromJson(Map<String, dynamic> json) => _Visit(
  id: json['id'] as String,
  ownerId: json['ownerId'] as String,
  ownerType: json['ownerType'] as String? ?? PatientOwnerType.doctor,
  patientId: json['patientId'] as String,
  toothNumber: json['toothNumber'] as String?,
  treatmentType: json['treatmentType'] as String? ?? TreatmentType.other,
  description: json['description'] as String? ?? '',
  cost: json['cost'] as num? ?? 0,
  paidAtVisit: json['paidAtVisit'] as num? ?? 0,
  followUpNeeded: json['followUpNeeded'] as bool? ?? false,
  visitDate: const TimestampConverter().fromJson(json['visitDate']),
  createdByUid: json['createdByUid'] as String,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$VisitToJson(_Visit instance) => <String, dynamic>{
  'id': instance.id,
  'ownerId': instance.ownerId,
  'ownerType': instance.ownerType,
  'patientId': instance.patientId,
  'toothNumber': instance.toothNumber,
  'treatmentType': instance.treatmentType,
  'description': instance.description,
  'cost': instance.cost,
  'paidAtVisit': instance.paidAtVisit,
  'followUpNeeded': instance.followUpNeeded,
  'visitDate': const TimestampConverter().toJson(instance.visitDate),
  'createdByUid': instance.createdByUid,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};

_PatientPayment _$PatientPaymentFromJson(Map<String, dynamic> json) =>
    _PatientPayment(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      ownerType: json['ownerType'] as String? ?? PatientOwnerType.doctor,
      patientId: json['patientId'] as String,
      amount: json['amount'] as num,
      method: json['method'] as String? ?? 'cash',
      recordedByUid: json['recordedByUid'] as String,
      recordedAt: const TimestampConverter().fromJson(json['recordedAt']),
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$PatientPaymentToJson(_PatientPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'ownerType': instance.ownerType,
      'patientId': instance.patientId,
      'amount': instance.amount,
      'method': instance.method,
      'recordedByUid': instance.recordedByUid,
      'recordedAt': const TimestampConverter().toJson(instance.recordedAt),
      'note': instance.note,
    };
