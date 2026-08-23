import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_stats.freezed.dart';
part 'patient_stats.g.dart';

/// Denormalized per-patient stats, maintained exclusively by Cloud Functions
/// (onVisitCreated / onPatientPaymentCreated) via FieldValue.increment. Never
/// write these fields directly from the client. Mirrors [DoctorStats].
@freezed
abstract class PatientStats with _$PatientStats {
  const factory PatientStats({
    @Default(0) num totalPaid,
    @Default(0) num totalDebt,
  }) = _PatientStats;

  factory PatientStats.fromJson(Map<String, dynamic> json) =>
      _$PatientStatsFromJson(json);

  static const empty = PatientStats();

  factory PatientStats.fromMap(Map<String, dynamic>? map) {
    if (map == null) return PatientStats.empty;
    return PatientStats.fromJson(map);
  }
}
