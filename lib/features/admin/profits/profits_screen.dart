import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/order.dart';
import '../../../models/stats.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/stat_tile.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);
final _dateFormat = DateFormat.yMMMd('ar');

const _monthLabels = [
  'ينا', 'فبر', 'مار', 'أبر', 'ماي', 'يون',
  'يول', 'أغس', 'سبت', 'أكت', 'نوف', 'ديس',
];

class ProfitsScreen extends ConsumerWidget {
  const ProfitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsRepo = ref.watch(statsRepositoryProvider);
    final orderRepo = ref.watch(orderRepositoryProvider);
    final year = DateTime.now().year;

    return Scaffold(
      appBar: AppBar(title: const Text('الأرباح')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          StreamBuilder<GlobalStats>(
            stream: statsRepo.watchGlobalStats(),
            builder: (context, snap) {
              final stats = snap.data ?? GlobalStats.empty;
              return StatTileRow(tiles: [
                StatTile(
                  label: 'إجمالي الأرباح',
                  value: _currency.format(stats.totalProfitAllTime),
                  icon: Icons.paid_outlined,
                  color: AppTheme.success,
                ),
                StatTile(
                  label: 'أرباح هذا الشهر',
                  value: _currency.format(stats.totalProfitThisMonth),
                  icon: Icons.trending_up,
                  color: AppTheme.success,
                ),
                StatTile(
                  label: 'إجمالي الطلبات',
                  value: '${stats.totalOrdersAllTime}',
                  icon: Icons.receipt_long_outlined,
                ),
                StatTile(
                  label: 'طلبات هذا الشهر',
                  value: '${stats.totalOrdersThisMonth}',
                  icon: Icons.calendar_month_outlined,
                ),
              ]);
            },
          ),
          const SizedBox(height: 24),
          Text('الأرباح خلال $year', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          SizedBox(
            height: 220,
            child: StreamBuilder<List<MonthlyProfit>>(
              stream: statsRepo.watchMonthlyProfitForYear(year),
              builder: (context, snap) {
                final data = {for (final m in snap.data ?? <MonthlyProfit>[]) m.monthKey: m};
                final maxY = (data.values.isEmpty
                        ? 100
                        : data.values.map((m) => m.totalProfit).reduce((a, b) => a > b ? a : b))
                    .toDouble();
                return BarChart(
                  BarChartData(
                    maxY: maxY <= 0 ? 100 : maxY * 1.2,
                    barGroups: List.generate(12, (i) {
                      final key = '$year-${(i + 1).toString().padLeft(2, '0')}';
                      final value = data[key]?.totalProfit.toDouble() ?? 0;
                      return BarChartGroupData(x: i, barRods: [
                        BarChartRodData(
                          toY: value,
                          color: AppTheme.primary,
                          width: 14,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ]);
                    }),
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) => Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(_monthLabels[value.toInt()],
                                style: const TextStyle(fontSize: 10)),
                          ),
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: const FlGridData(show: false),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Text('تقرير الطلبات (الأحدث أولاً)', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          StreamBuilder<List<Order>>(
            stream: orderRepo.watchOrders(),
            builder: (context, snap) {
              final orders = snap.data ?? [];
              return Column(
                children: orders
                    .map((o) => Card(
                          child: ListTile(
                            title: Text(o.doctorNameSnapshot),
                            subtitle: o.createdAt != null
                                ? Text(_dateFormat.format(o.createdAt!))
                                : null,
                            trailing: Text(_currency.format(o.totalAmount)),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
