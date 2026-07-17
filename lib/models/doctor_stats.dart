import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'doctor_stats.freezed.dart';
part 'doctor_stats.g.dart';

/// Denormalized per-doctor stats, maintained exclusively by Cloud Functions
/// (onOrderCreated / onPaymentCreated) via FieldValue.increment. Never write
/// these fields directly from the client.
@freezed
class DoctorStats with _$DoctorStats {
  const factory DoctorStats({
    @Default(0) int totalOrders,
    @Default(0) num totalSpent,
    @Default(0) num totalDebt,
    @TimestampConverter() DateTime? lastOrderAt,
  }) = _DoctorStats;

  factory DoctorStats.fromJson(Map<String, dynamic> json) =>
      _$DoctorStatsFromJson(json);

  static const empty = DoctorStats();

  factory DoctorStats.fromMap(Map<String, dynamic>? map) {
    if (map == null) return DoctorStats.empty;
    return DoctorStats.fromJson(map);
  }
}
