import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/user_profile.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/stat_tile.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: 'ر.س', decimalDigits: 0);

/// Deliberately minimal per spec: order count + amount owed, a link to
/// past orders, and one big "create order" call to action — no admin-style
/// dense dashboard here.
class DoctorDashboardScreen extends ConsumerWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);
    final uid = auth.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('dentex'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => auth.signOut(),
          ),
        ],
      ),
      body: uid == null
          ? const SizedBox.shrink()
          : StreamBuilder<UserProfile?>(
              stream: ref.watch(userRepositoryProvider).watchUser(uid),
              builder: (context, snap) {
                final profile = snap.data;
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    if (profile != null)
                      Text('مرحباً د. ${profile.name}',
                          style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    StatTileRow(tiles: [
                      StatTile(
                        label: 'عدد طلبياتي',
                        value: '${profile?.stats.totalOrders ?? 0}',
                        icon: Icons.receipt_long_outlined,
                      ),
                      StatTile(
                        label: 'متأخر عليّ',
                        value: _currency.format(profile?.stats.totalDebt ?? 0),
                        icon: Icons.warning_amber_outlined,
                        color: AppTheme.warning,
                      ),
                    ]),
                    const SizedBox(height: 20),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () => context.push('/doctor/orders'),
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(Icons.receipt_long, color: AppTheme.primary),
                              SizedBox(width: 12),
                              Text('فواتيري / طلبياتي',
                                  style: TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 120,
                      child: FilledButton.icon(
                        onPressed: () => context.push('/doctor/create-order'),
                        icon: const Icon(Icons.add_shopping_cart, size: 32),
                        label: const Text('إنشاء طلبية',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
