import '../../models/consumption_mapping.dart';
import '../../models/order.dart';
import '../../models/patient.dart';

/// One "you've likely used up what you last ordered" prompt.
class ReorderSuggestion {
  const ReorderSuggestion({
    required this.mapping,
    required this.consumedSinceLastOrder,
    required this.lastOrderedQuantity,
    required this.lastOrderDate,
  });

  final ConsumptionMapping mapping;
  final num consumedSinceLastOrder;
  final num lastOrderedQuantity;
  final DateTime lastOrderDate;
}

/// The clinic-management module's "الربط التجاري" — ties recorded
/// treatments back to the supply catalog based on actual usage, not
/// browsing. Deliberately avoids tracking an absolute "remaining stock"
/// number (which would need the doctor to calibrate a starting quantity
/// the app has no way to verify, and drifts silently wrong over time).
/// Instead it compares two things it can measure directly: how many units
/// this product's last order actually contained, versus how many
/// treatments consuming it (via [ConsumptionMapping]) have been recorded
/// since that order — once consumption catches up to what was last
/// bought, it's time to reorder. A product never ordered before has no
/// baseline yet, so it's skipped rather than guessed at.
///
/// [orders] is this doctor's own order history — orders stay per-doctor
/// even inside a medical center (see UserProfile.clinicOwnerId's doc
/// comment), so a center doctor's suggestions are based on their own past
/// orders specifically, while [visits] (shared clinic-wide) drive the
/// consumption side.
List<ReorderSuggestion> computeReorderSuggestions(
  List<ConsumptionMapping> mappings,
  List<Visit> visits,
  List<Order> orders,
) {
  final suggestions = <ReorderSuggestion>[];

  for (final mapping in mappings) {
    DateTime? lastOrderDate;
    num lastOrderedQuantity = 0;
    for (final order in orders) {
      if (order.createdAt == null) continue;
      for (final item in order.items) {
        if (item.productId != mapping.productId || item.variantId != mapping.variantId) {
          continue;
        }
        if (lastOrderDate == null || order.createdAt!.isAfter(lastOrderDate)) {
          lastOrderDate = order.createdAt;
          lastOrderedQuantity = item.quantity;
        }
      }
    }
    if (lastOrderDate == null || lastOrderedQuantity <= 0) {
      continue; // never ordered this product before — no baseline to compare against
    }

    final treatmentsSince = visits.where((v) =>
        v.treatmentType == mapping.treatmentType &&
        v.visitDate != null &&
        v.visitDate!.isAfter(lastOrderDate!));
    final consumedSinceLastOrder =
        treatmentsSince.length * mapping.quantityPerTreatment;

    if (consumedSinceLastOrder >= lastOrderedQuantity) {
      suggestions.add(ReorderSuggestion(
        mapping: mapping,
        consumedSinceLastOrder: consumedSinceLastOrder,
        lastOrderedQuantity: lastOrderedQuantity,
        lastOrderDate: lastOrderDate,
      ));
    }
  }

  return suggestions;
}
