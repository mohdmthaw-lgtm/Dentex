import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/doctor_tier.dart';
import '../../../models/order.dart';
import '../../../models/stats.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/stat_tile.dart';
import '../../../shared/widgets/tier_badge.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);

class CustomersScreen extends ConsumerStatefulWidget {
  const CustomersScreen({super.key});

  @override
  ConsumerState<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends ConsumerState<CustomersScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final statsRepo = ref.watch(statsRepositoryProvider);
    final userRepo = ref.watch(userRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('الزبائن')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          StreamBuilder<GlobalStats>(
            stream: statsRepo.watchGlobalStats(),
            builder: (context, snap) {
              final stats = snap.data ?? GlobalStats.empty;
              return StatTileRow(tiles: [
                StatTile(
                  label: 'إجمالي الزبائن',
                  value: '${stats.totalCustomers}',
                  icon: Icons.people_alt_outlined,
                ),
                StatTile(
                  label: 'إجمالي الديون',
                  value: _currency.format(stats.totalOutstandingDebt),
                  icon: Icons.warning_amber_outlined,
                  color: AppTheme.warning,
                ),
                StatTile(
                  label: 'إجمالي المبيعات',
                  value: _currency.format(stats.totalProfitAllTime),
                  icon: Icons.point_of_sale_outlined,
                  color: AppTheme.success,
                ),
              ]);
            },
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              labelText: 'ابحث باسم الزبون أو العيادة',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (v) => setState(() => _query = v),
          ),
          const SizedBox(height: 12),
          StreamBuilder<List<UserProfile>>(
            stream: userRepo.watchDoctors(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              var doctors = snap.data ?? [];
              if (_query.trim().isNotEmpty) {
                final q = _query.trim().toLowerCase();
                doctors = doctors
                    .where((d) =>
                        d.name.toLowerCase().contains(q) ||
                        d.clinicName.toLowerCase().contains(q) ||
                        d.phone.contains(q))
                    .toList();
              }
              if (doctors.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: Text('لا يوجد زبائن')),
                );
              }
              return Column(
                children: doctors
                    .map((d) => Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(child: Icon(Icons.person)),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(d.name, style: Theme.of(context).textTheme.titleMedium),
                                      Text(
                                          '${d.clinicName}${d.location.isNotEmpty ? ' • ${d.location}' : ''}',
                                          style: Theme.of(context).textTheme.bodySmall),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    _DoctorTierBadge(doctorId: d.uid),
                                    const SizedBox(height: 4),
                                    Text('${d.stats.totalOrders} طلب',
                                        style: Theme.of(context).textTheme.bodySmall),
                                    Text(_currency.format(d.stats.totalSpent),
                                        style: const TextStyle(fontWeight: FontWeight.bold)),
                                    if (d.stats.totalDebt > 0)
                                      Text('دين ${_currency.format(d.stats.totalDebt)}',
                                          style: const TextStyle(
                                              color: AppTheme.danger, fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
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

/// Shows this doctor's loyalty tier for the current calendar year — computed
/// live from their orders, never stored (see computeDoctorTierInfo).
class _DoctorTierBadge extends ConsumerWidget {
  const _DoctorTierBadge({required this.doctorId});
  final String doctorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<Order>>(
      stream: ref.watch(orderRepositoryProvider).watchOrdersForDoctor(doctorId),
      builder: (context, snap) {
        final tierInfo = computeDoctorTierInfo(snap.data ?? []);
        return TierBadge(tier: tierInfo.tier);
      },
    );
  }
}
