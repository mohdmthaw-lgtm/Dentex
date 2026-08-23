// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorStats _$DoctorStatsFromJson(Map<String, dynamic> json) => _DoctorStats(
  totalOrders: (json['totalOrders'] as num?)?.toInt() ?? 0,
  totalSpent: json['totalSpent'] as num? ?? 0,
  totalDebt: json['totalDebt'] as num? ?? 0,
  lastOrderAt: const TimestampConverter().fromJson(json['lastOrderAt']),
);

Map<String, dynamic> _$DoctorStatsToJson(_DoctorStats instance) =>
    <String, dynamic>{
      'totalOrders': instance.totalOrders,
      'totalSpent': instance.totalSpent,
      'totalDebt': instance.totalDebt,
      'lastOrderAt': const TimestampConverter().toJson(instance.lastOrderAt),
    };
