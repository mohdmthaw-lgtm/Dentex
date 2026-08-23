import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/clinic_summary.dart';
import '../../../models/patient.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/stat_tile.dart';

/// /doctor/accounting — today/this-month income + patients-today (all
/// recomputed live via computeClinicSummary, see that file's docs on why
/// nothing here is persisted) plus the one persisted aggregate,
/// clinicStats.totalDebt.
class AccountingDashboardScreen extends ConsumerWidget {
  const AccountingDashboardScreen({super.key, required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ownerId = profile.clinicOwnerId;
    final ownerType = profile.clinicOwnerType;
    final repo = ref.watch(patientRepositoryProvider);
    final monthStart = DateTime(DateTime.now().year, DateTime.now().month, 1);

    return Scaffold(
      appBar: AppBar(title: const Text('حساباتي')),
      body: StreamBuilder<List<Visit>>(
        stream: repo.watchVisitsForOwner(ownerId, ownerType, start: monthStart),
        builder: (context, visitsSnap) {
          return StreamBuilder<List<PatientPayment>>(
            stream: repo.watchPaymentsForOwner(ownerId, ownerType, start: monthStart),
            builder: (context, paymentsSnap) {
              final summary = computeClinicSummary(
                visitsSnap.data ?? [],
                paymentsSnap.data ?? [],
              );
              return StreamBuilder<List<Patient>>(
                stream: repo.watchDebtors(ownerId, ownerType),
                builder: (context, debtorsSnap) {
                  final totalDebt = (debtorsSnap.data ?? [])
                      .fold<num>(0, (sum, p) => sum + p.stats.totalDebt);
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      StatTileRow(tiles: [
                        StatTile(
                          label: 'دخل اليوم',
                          value: '${summary.incomeToday.toStringAsFixed(0)} ₪',
                          icon: Icons.today_outlined,
                          color: AppTheme.warning,
                        ),
                        StatTile(
                          label: 'دخل الشهر',
                          value: '${summary.incomeThisMonth.toStringAsFixed(0)} ₪',
                          icon: Icons.calendar_month_outlined,
                          color: AppTheme.success,
                        ),
                        StatTile(
                          label: 'مرضى اليوم',
                          value: '${summary.patientsToday}',
                          icon: Icons.groups_outlined,
                          color: AppTheme.primaryDark,
                        ),
                        StatTile(
                          label: 'ديون قائمة',
                          value: '${totalDebt.toStringAsFixed(0)} ₪',
                          icon: Icons.warning_amber_outlined,
                          color: totalDebt > 0 ? AppTheme.warning : Colors.grey,
                        ),
                      ]),
                      const SizedBox(height: 20),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: ListTile(
                          leading: const Icon(Icons.receipt_long_outlined, color: AppTheme.warning),
                          title: const Text('ديون المرضى'),
                          subtitle: const Text('عرض المرضى المدينين وتسجيل الدفعات'),
                          trailing: const Icon(Icons.chevron_left),
                          onTap: () => context.push('/doctor/accounting/debts', extra: profile),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: ListTile(
                          leading: const Icon(Icons.list_alt_outlined, color: AppTheme.warning),
                          title: const Text('سجل المعاملات'),
                          subtitle: const Text('كل الزيارات والدفعات، مع تصدير PDF'),
                          trailing: const Icon(Icons.chevron_left),
                          onTap: () =>
                              context.push('/doctor/accounting/transactions', extra: profile),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: ListTile(
                          leading: const Icon(Icons.account_balance_wallet_outlined,
                              color: AppTheme.success),
                          title: const Text('المصاريف وصافي الربح'),
                          subtitle: const Text('سجل المصاريف، ديون الموردين، وتقرير شهري'),
                          trailing: const Icon(Icons.chevron_left),
                          onTap: () =>
                              context.push('/doctor/accounting/expenses', extra: profile),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
