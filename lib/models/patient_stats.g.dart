// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatientStats _$PatientStatsFromJson(Map<String, dynamic> json) =>
    _PatientStats(
      totalPaid: json['totalPaid'] as num? ?? 0,
      totalDebt: json['totalDebt'] as num? ?? 0,
    );

Map<String, dynamic> _$PatientStatsToJson(_PatientStats instance) =>
    <String, dynamic>{
      'totalPaid': instance.totalPaid,
      'totalDebt': instance.totalDebt,
    };
