import { Tiers } from "./constants";

// Mirrors lib/core/constants/loyalty_tiers.dart — keep both in sync.
export const TIER_THRESHOLDS: Record<string, number> = {
  [Tiers.gold]: 2000,
  [Tiers.platinum]: 5000,
};

interface OrderForTier {
  totalAmount?: number;
  amountRemaining?: number;
  createdAt?: FirebaseFirestore.Timestamp;
}

// Mirrors lib/core/constants/loyalty_tiers.dart's tierMeta labels/emojis.
export const TIER_LABELS: Record<string, string> = {
  [Tiers.silver]: "فضي 🩶",
  [Tiers.gold]: "ذهبي 🥇",
  [Tiers.platinum]: "بلاتيني 💎",
};

export interface DoctorTierInfo {
  tier: string;
  rawTier: string;
  spend: number;
  frozen: boolean;
  year: number;
}

/**
 * Mirrors lib/core/utils/doctor_tier.dart's computeDoctorTierInfo — only
 * the subset needed server-side to detect a within-year upgrade or a
 * new-year reset (onOrderCreated.ts). The discount itself is computed
 * client-side at order-creation time; this never writes a "current tier"
 * anywhere, only the lastSeenTier/lastSeenTierYear detection cursor.
 */
export function computeDoctorTierInfo(
  ordersThisDoctor: OrderForTier[],
  now: Date = new Date()
): DoctorTierInfo {
  const year = now.getUTCFullYear();
  const ordersThisYear = ordersThisDoctor.filter(
    (o) => o.createdAt && o.createdAt.toDate().getUTCFullYear() === year
  );

  const spend = ordersThisYear.reduce((s, o) => s + (o.totalAmount ?? 0), 0);
  const remaining = ordersThisYear.reduce((s, o) => s + (o.amountRemaining ?? 0), 0);
  const overdueRatio = spend === 0 ? 0 : remaining / spend;
  const frozen = overdueRatio > 0.5;

  const rawTier =
    spend >= TIER_THRESHOLDS[Tiers.platinum]
      ? Tiers.platinum
      : spend >= TIER_THRESHOLDS[Tiers.gold]
      ? Tiers.gold
      : Tiers.silver;
  const tier = frozen ? Tiers.silver : rawTier;

  return { tier, rawTier, spend, frozen, year };
}
