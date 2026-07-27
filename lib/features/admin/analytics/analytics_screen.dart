import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/firestore_paths.dart';
import '../../../core/utils/doctor_tier.dart';
import '../../../models/order.dart';
import '../../../models/product_variant.dart';
import '../../../models/stats.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/stat_tile.dart';
import '../../../shared/widgets/tier_badge.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsRepo = ref.watch(statsRepositoryProvider);
    final productRepo = ref.watch(productRepositoryProvider);
    final userRepo = ref.watch(userRepositoryProvider);
    final orderRepo = ref.watch(orderRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('دراسات')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          StreamBuilder<GlobalStats>(
            stream: statsRepo.watchGlobalStats(),
            builder: (context, snap) {
              final stats = snap.data ?? GlobalStats.empty;
              return StatTileRow(tiles: [
                StatTile(
                  label: 'عدد العملاء',
                  value: '${stats.totalCustomers}',
                  icon: Icons.people_alt_outlined,
                ),
                StatTile(
                  label: 'عدد الطلبات',
                  value: '${stats.totalOrdersAllTime}',
                  icon: Icons.receipt_long_outlined,
                ),
                StatTile(
                  label: 'عدد المنتجات',
                  value: '${stats.totalProducts}',
                  icon: Icons.inventory_2_outlined,
                ),
              ]);
            },
          ),
          const SizedBox(height: 24),
          const _SectionTitle('أكثر المنتجات مبيعاً'),
          StreamBuilder<List<ProductVariant>>(
            stream: productRepo.watchBestSellingVariants(),
            builder: (context, snap) {
              final variants = (snap.data ?? []).where((v) => v.totalSold > 0).toList();
              if (variants.isEmpty) {
                return const _EmptyHint('لا توجد بيانات مبيعات بعد');
              }
              return Column(
                children: variants
                    .map((v) => Card(
                          child: ListTile(
                            leading: const Icon(Icons.local_fire_department_outlined),
                            title: Text('${v.productName} - ${v.label}'),
                            trailing: Text('${v.totalSold} وحدة مباعة'),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 24),
          const _SectionTitle('أكثر العملاء شراءً'),
          StreamBuilder<List<UserProfile>>(
            stream: userRepo.watchTopDoctorsBySpend(),
            builder: (context, snap) {
              final doctors = snap.data ?? [];
              if (doctors.isEmpty) return const _EmptyHint('لا توجد بيانات بعد');
              return Column(
                children: doctors
                    .map((d) => Card(
                          child: ListTile(
                            leading: const CircleAvatar(child: Icon(Icons.person)),
                            title: Text(d.name),
                            subtitle: Text(d.clinicName),
                            trailing: Text(_currency.format(d.stats.totalSpent)),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 24),
          const _SectionTitle('أعلى الديون'),
          StreamBuilder<List<UserProfile>>(
            stream: userRepo.watchTopDoctorsByDebt(),
            builder: (context, snap) {
              final doctors =
                  (snap.data ?? []).where((d) => d.stats.totalDebt > 0).toList();
              if (doctors.isEmpty) return const _EmptyHint('لا توجد ديون حالياً');
              return Column(
                children: doctors
                    .map((d) => Card(
                          child: ListTile(
                            leading: const Icon(Icons.warning_amber_outlined),
                            title: Text(d.name),
                            subtitle: Text(d.clinicName),
                            trailing: Text(_currency.format(d.stats.totalDebt)),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 24),
          _SectionTitle('توزيع الأطباء حسب المستوى لعام ${DateTime.now().year}'),
          StreamBuilder<List<UserProfile>>(
            stream: userRepo.watchDoctors(),
            builder: (context, snap) {
              final doctors = snap.data ?? [];
              if (doctors.isEmpty) return const _EmptyHint('لا يوجد أطباء بعد');
              return FutureBuilder<List<DoctorTierInfo>>(
                future: Future.wait(doctors.map((d) =>
                    orderRepo.getOrdersForDoctor(d.uid).then(computeDoctorTierInfo))),
                builder: (context, tierSnap) {
                  final infos = tierSnap.data;
                  if (infos == null) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  const tiers = [DoctorTier.platinum, DoctorTier.gold, DoctorTier.silver];
                  return Column(
                    children: tiers
                        .map((t) => Card(
                              child: ListTile(
                                leading: TierBadge(tier: t),
                                title: Text('${infos.where((i) => i.tier == t).length} طبيب'),
                              ),
                            ))
                        .toList(),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 24),
          const _SectionTitle('أعلى الطلبات قيمة'),
          StreamBuilder<List<Order>>(
            stream: orderRepo.watchHighestValueOrders(),
            builder: (context, snap) {
              final orders = snap.data ?? [];
              if (orders.isEmpty) return const _EmptyHint('لا توجد طلبات بعد');
              return Column(
                children: orders
                    .map((o) => Card(
                          child: ListTile(
                            title: Text(o.doctorNameSnapshot),
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class _EmptyHint extends StatelessWidget {
  const _EmptyHint(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(text, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
