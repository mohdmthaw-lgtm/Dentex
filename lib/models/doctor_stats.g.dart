// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorStatsImpl _$$DoctorStatsImplFromJson(Map<String, dynamic> json) =>
    _$DoctorStatsImpl(
      totalOrders: (json['totalOrders'] as num?)?.toInt() ?? 0,
      totalSpent: json['totalSpent'] as num? ?? 0,
      totalDebt: json['totalDebt'] as num? ?? 0,
      lastOrderAt: const TimestampConverter().fromJson(json['lastOrderAt']),
    );

Map<String, dynamic> _$$DoctorStatsImplToJson(_$DoctorStatsImpl instance) =>
    <String, dynamic>{
      'totalOrders': instance.totalOrders,
      'totalSpent': instance.totalSpent,
      'totalDebt': instance.totalDebt,
      'lastOrderAt': const TimestampConverter().toJson(instance.lastOrderAt),
    };
