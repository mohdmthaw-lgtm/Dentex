import '../../models/order.dart';
import '../constants/firestore_paths.dart';
import '../constants/loyalty_tiers.dart';

/// A doctor's loyalty-tier standing, always derived fresh from this
/// calendar year's orders — never stored. See computeDoctorTierInfo.
class DoctorTierInfo {
  const DoctorTierInfo({
    required this.tier,
    required this.rawTier,
    required this.spend,
    required this.remaining,
    required this.frozen,
    required this.progressPercent,
    required this.nextTier,
    required this.amountToNext,
    required this.year,
  });

  /// The tier that actually applies (silver if frozen, regardless of spend).
  final String tier;

  /// The tier spend alone would justify, ignoring any debt freeze.
  final String rawTier;

  final num spend;
  final num remaining;
  final bool frozen;

  /// 0..1 progress toward [nextTier], based on [tier]'s rung.
  final double progressPercent;

  final String? nextTier;
  final num amountToNext;
  final int year;
}

/// Recomputes a doctor's tier standing from scratch every time — nothing
/// about the tier itself is ever persisted, so a new calendar year
/// automatically resets everyone to silver with zero migration/reset code.
DoctorTierInfo computeDoctorTierInfo(List<Order> doctorOrders, {DateTime? now}) {
  final currentYear = (now ?? DateTime.now()).year;
  final ordersThisYear =
      doctorOrders.where((o) => o.createdAt != null && o.createdAt!.year == currentYear);

  final spend = ordersThisYear.fold<num>(0, (sum, o) => sum + o.totalAmount);
  final remaining = ordersThisYear.fold<num>(0, (sum, o) => sum + o.amountRemaining);
  final overdueRatio = spend == 0 ? 0.0 : remaining / spend;
  final frozen = overdueRatio > 0.5;

  final goldThreshold = tierThresholds[DoctorTier.gold]!;
  final platinumThreshold = tierThresholds[DoctorTier.platinum]!;
  final rawTier = spend >= platinumThreshold
      ? DoctorTier.platinum
      : spend >= goldThreshold
          ? DoctorTier.gold
          : DoctorTier.silver;
  final tier = frozen ? DoctorTier.silver : rawTier;

  double progress;
  String? nextTier;
  num amountToNext;
  switch (tier) {
    case DoctorTier.silver:
      progress = spend / goldThreshold;
      nextTier = DoctorTier.gold;
      amountToNext = goldThreshold - spend;
      break;
    case DoctorTier.gold:
      progress = (spend - goldThreshold) / (platinumThreshold - goldThreshold);
      nextTier = DoctorTier.platinum;
      amountToNext = platinumThreshold - spend;
      break;
    default:
      progress = 1;
      nextTier = null;
      amountToNext = 0;
  }
  progress = progress.clamp(0, 1).toDouble();
  amountToNext = amountToNext < 0 ? 0 : amountToNext;

  return DoctorTierInfo(
    tier: tier,
    rawTier: rawTier,
    spend: spend,
    remaining: remaining,
    frozen: frozen,
    progressPercent: progress,
    nextTier: nextTier,
    amountToNext: amountToNext,
    year: currentYear,
  );
}
