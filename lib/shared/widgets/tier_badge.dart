import 'package:flutter/material.dart';

import '../../core/constants/firestore_paths.dart';
import '../../core/constants/loyalty_tiers.dart';

/// Pill badge showing a doctor's current tier (emoji + label) — e.g. the
/// admin's customer list or an analytics breakdown. Matches this app's
/// existing ad-hoc pill convention (12%-opacity fill, colored text, 6px
/// radius) seen in _Badge/_StatusChip across the orders screens.
class TierBadge extends StatelessWidget {
  const TierBadge({super.key, required this.tier});
  final String tier;

  @override
  Widget build(BuildContext context) {
    final meta = tierMeta[tier] ?? tierMeta[DoctorTier.silver]!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: meta.color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text('${meta.emoji} ${meta.label}',
          style: TextStyle(color: meta.color, fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }
}

/// Pill badge showing the discount percentage a frozen order got, tied to
/// the tier that earned it — placed next to a discounted subtotal.
class TierDiscountBadge extends StatelessWidget {
  const TierDiscountBadge({super.key, required this.tier, required this.rate});
  final String tier;
  final num rate;

  @override
  Widget build(BuildContext context) {
    final meta = tierMeta[tier] ?? tierMeta[DoctorTier.silver]!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: meta.color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text('خصم ${(rate * 100).toStringAsFixed(0)}٪ ${meta.emoji}',
          style: TextStyle(color: meta.color, fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }
}
