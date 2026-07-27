import 'package:flutter/material.dart';

import 'firestore_paths.dart';

/// Spend (₪) within the current calendar year required to reach each tier
/// above silver (silver itself has no threshold — it's the default).
const Map<String, num> tierThresholds = {
  DoctorTier.gold: 2000,
  DoctorTier.platinum: 5000,
};

/// Discount applied to new orders while a doctor holds each tier.
const Map<String, num> tierDiscounts = {
  DoctorTier.silver: 0,
  DoctorTier.gold: 0.05,
  DoctorTier.platinum: 0.10,
};

class TierMeta {
  const TierMeta({required this.label, required this.emoji, required this.color});

  final String label;
  final String emoji;
  final Color color;
}

const Map<String, TierMeta> tierMeta = {
  DoctorTier.silver: TierMeta(label: 'فضي', emoji: '🩶', color: Color(0xFF8A9A96)),
  DoctorTier.gold: TierMeta(label: 'ذهبي', emoji: '🥇', color: Color(0xFFC9A227)),
  DoctorTier.platinum: TierMeta(label: 'بلاتيني', emoji: '💎', color: Color(0xFF4F8B8D)),
};

/// Reverse lookup for displaying a frozen order's discountRate with the
/// tier that earned it — falls back to gold for any rate that doesn't
/// exactly match a known tier (shouldn't happen, but old/edited data could
/// in principle carry an arbitrary rate).
String tierForDiscountRate(num rate) {
  for (final entry in tierDiscounts.entries) {
    if (entry.value == rate) return entry.key;
  }
  return DoctorTier.gold;
}
