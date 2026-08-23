import '../../models/patient.dart';

/// A doctor's/center's accounting-dashboard numbers for a given day and
/// month, always derived fresh from a bounded [Visit]/[PatientPayment]
/// query — never stored. Mirrors the "recompute, don't persist" approach
/// [computeDoctorTierInfo] uses for loyalty tiers; the one number that IS
/// persisted (clinicStats.totalDebt) is a running total that would be
/// expensive to recompute from full history on every dashboard load.
class ClinicSummary {
  const ClinicSummary({
    required this.incomeToday,
    required this.incomeThisMonth,
    required this.patientsToday,
  });

  final num incomeToday;
  final num incomeThisMonth;
  final int patientsToday;
}

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

/// [visits] and [payments] should already be scoped to the current
/// calendar month (see PatientRepository.watchVisitsForOwner/
/// watchPaymentsForOwner with a `start` bound) — this function only slices
/// that month down to "today" for the two day-scoped numbers.
ClinicSummary computeClinicSummary(
  List<Visit> visits,
  List<PatientPayment> payments, {
  DateTime? now,
}) {
  final today = now ?? DateTime.now();

  final visitsToday = visits.where((v) => v.visitDate != null && _isSameDay(v.visitDate!, today));
  final paymentsToday =
      payments.where((p) => p.recordedAt != null && _isSameDay(p.recordedAt!, today));

  final incomeTodayFromVisits =
      visitsToday.fold<num>(0, (sum, v) => sum + v.paidAtVisit);
  final incomeTodayFromPayments =
      paymentsToday.fold<num>(0, (sum, p) => sum + p.amount);

  final incomeThisMonth = visits.fold<num>(0, (sum, v) => sum + v.paidAtVisit) +
      payments.fold<num>(0, (sum, p) => sum + p.amount);

  final patientsToday = visitsToday.map((v) => v.patientId).toSet().length;

  return ClinicSummary(
    incomeToday: incomeTodayFromVisits + incomeTodayFromPayments,
    incomeThisMonth: incomeThisMonth,
    patientsToday: patientsToday,
  );
}
