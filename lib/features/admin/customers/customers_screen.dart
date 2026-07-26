import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/stats.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/stat_tile.dart';

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
                          child: ListTile(
                            leading: const CircleAvatar(child: Icon(Icons.person)),
                            title: Text(d.name),
                            subtitle: Text(
                                '${d.clinicName}${d.location.isNotEmpty ? ' • ${d.location}' : ''}'),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
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
