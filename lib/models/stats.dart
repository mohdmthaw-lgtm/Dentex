import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

/// stats/global — singleton doc, Cloud-Function maintained only.
/// Order *count* fields are incremented at order-creation time; profit
/// fields are only incremented when an order's status transitions to
/// "completed" (confirmed business rule: profit counts at completion,
/// not at order placement).
@freezed
class GlobalStats with _$GlobalStats {
  const factory GlobalStats({
    @Default(0) int totalProducts,
    @Default(0) int totalCustomers,
    @Default(0) int totalOrdersAllTime,
    @Default(0) int totalOrdersThisMonth,
    @Default(0) num totalProfitAllTime,
    @Default(0) num totalProfitThisMonth,
    @Default(0) num totalOutstandingDebt,
  }) = _GlobalStats;

  static const empty = GlobalStats();

  factory GlobalStats.fromJson(Map<String, dynamic> json) =>
      _$GlobalStatsFromJson(json);
}

/// stats/monthlyProfit/{YYYY-MM} — keyed by order *completion* month.
@freezed
class MonthlyProfit with _$MonthlyProfit {
  const factory MonthlyProfit({
    required String monthKey, // "YYYY-MM"
    @Default(0) num totalProfit,
    @Default(0) int totalOrders,
    @Default(0) num totalRevenue,
  }) = _MonthlyProfit;

  factory MonthlyProfit.fromJson(Map<String, dynamic> json) =>
      _$MonthlyProfitFromJson(json);

  factory MonthlyProfit.fromDoc(String id, Map<String, dynamic> data) =>
      MonthlyProfit.fromJson({...data, 'monthKey': id});
}
