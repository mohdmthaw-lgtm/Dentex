import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/activity_log_entry.dart';
import '../../../models/stats.dart';
import '../../../services/firebase/service_providers.dart';

final _currency = NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(statsRepositoryProvider).watchGlobalStats();
    final activityAsync =
        ref.watch(activityLogRepositoryProvider).watchRecent(limit: 20);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/dentex_logo.png', height: 36),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authServiceProvider).signOut(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            StreamBuilder<GlobalStats>(
              stream: statsAsync,
              builder: (context, snap) {
                final stats = snap.data ?? GlobalStats.empty;
                return Row(
                  children: [
                    Expanded(
                      child: _QuickStatChip(
                        label: 'المنتجات',
                        value: '${stats.totalProducts}',
                        icon: Icons.inventory_2_rounded,
                        color: AppTheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _QuickStatChip(
                        label: 'أرباح الشهر',
                        value: _currency.format(stats.totalProfitThisMonth),
                        icon: Icons.trending_up_rounded,
                        color: AppTheme.success,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _QuickStatChip(
                        label: 'طلبات الشهر',
                        value: '${stats.totalOrdersThisMonth}',
                        icon: Icons.local_shipping_rounded,
                        color: AppTheme.primaryDark,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _QuickStatChip(
                        label: 'الديون',
                        value: _currency.format(stats.totalOutstandingDebt),
                        icon: Icons.account_balance_wallet_rounded,
                        color: AppTheme.warning,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            const _NavGrid(),
            const SizedBox(height: 24),
            Text('آخر الحركات', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            StreamBuilder<List<ActivityLogEntry>>(
              stream: activityAsync,
              builder: (context, snap) {
                final entries = snap.data ?? [];
                if (entries.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Center(child: Text('لا توجد حركات بعد')),
                  );
                }
                return Column(
                  children: entries
                      .map((e) => Card(
                            child: ListTile(
                              leading: Icon(_iconFor(e.type)),
                              title: Text(e.message),
                              subtitle: e.createdAt != null
                                  ? Text(DateFormat.yMMMd('ar')
                                      .add_jm()
                                      .format(e.createdAt!))
                                  : null,
                            ),
                          ))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconFor(String type) {
    switch (type) {
      case 'order_created':
        return Icons.add_shopping_cart;
      case 'order_status_changed':
        return Icons.sync;
      case 'payment_recorded':
        return Icons.payments_outlined;
      case 'product_added':
      case 'product_edited':
        return Icons.inventory_2_outlined;
      case 'stock_low':
      case 'stock_out':
        return Icons.warning_amber_outlined;
      default:
        return Icons.info_outline;
    }
  }
}

/// Compact, colour-forward stat chip for the dashboard's top strip —
/// deliberately unlike [_NavTile]'s white card/left-aligned-icon look, so
/// "at a glance" numbers read as a different kind of element than the
/// tappable nav buttons below them, and take a single short row instead of
/// a whole 2x2 grid.
class _QuickStatChip extends StatelessWidget {
  const _QuickStatChip({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 16),
          ),
          const SizedBox(height: 6),
          FittedBox(
            child: Text(
              value,
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 15),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10, color: color.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}

class _NavTileData {
  const _NavTileData(this.label, this.icon, this.route, this.color);
  final String label;
  final IconData icon;
  final String route;
  final Color color;
}

class _NavGrid extends StatelessWidget {
  const _NavGrid();

  static const _tiles = [
    _NavTileData('المنتجات', Icons.inventory_2, '/admin/products', AppTheme.primary),
    _NavTileData('الطلبات', Icons.receipt_long, '/admin/orders', AppTheme.primaryDark),
    _NavTileData('الأرباح', Icons.bar_chart, '/admin/profits', AppTheme.success),
    _NavTileData('دراسات', Icons.insights, '/admin/analytics', AppTheme.warning),
    _NavTileData('الزبائن', Icons.people_alt, '/admin/customers', AppTheme.danger),
    _NavTileData('العروض', Icons.local_offer, '/admin/offers', AppTheme.warning),
    _NavTileData('الشحنات', Icons.local_shipping, '/admin/shipments', AppTheme.primary),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.3,
      children: _tiles.map((t) => _NavTile(t)).toList(),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile(this.data);
  final _NavTileData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push(data.route),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: data.color.withOpacity(0.12),
                child: Icon(data.icon, color: data.color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  data.label,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
