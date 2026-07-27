import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/firestore_paths.dart';
import '../../../core/constants/loyalty_tiers.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/order.dart';
import '../../../services/firebase/service_providers.dart';
import '../../../shared/widgets/tier_badge.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);
final _dateFormat = DateFormat.yMMMd('ar');

enum _OrdersFilter { all, debt, waiting }

/// The doctor's order/invoice history. Also reachable pre-filtered — e.g.
/// the dashboard's "متأخر عليّ" tile links here with the debt filter
/// already applied, so the doctor lands straight on what they owe on.
class MyOrdersScreen extends ConsumerStatefulWidget {
  const MyOrdersScreen({super.key, this.initialFilter});

  /// 'debt' | 'waiting' | null (all) — see _OrdersFilter.
  final String? initialFilter;

  @override
  ConsumerState<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends ConsumerState<MyOrdersScreen> {
  late _OrdersFilter _filter;

  @override
  void initState() {
    super.initState();
    _filter = switch (widget.initialFilter) {
      'debt' => _OrdersFilter.debt,
      'waiting' => _OrdersFilter.waiting,
      _ => _OrdersFilter.all,
    };
  }

  @override
  Widget build(BuildContext context) {
    final uid = ref.watch(authServiceProvider).currentUser?.uid;
    if (uid == null) return const SizedBox.shrink();

    final ordersStream = ref.watch(orderRepositoryProvider).watchOrdersForDoctor(uid);

    return Scaffold(
      appBar: AppBar(title: const Text('طلبياتي')),
      body: StreamBuilder<List<Order>>(
        stream: ordersStream,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final allOrders = snap.data ?? [];
          final debtOrders = allOrders.where((o) => o.amountRemaining > 0).length;
          final waitingOrders =
              allOrders.where((o) => o.status == OrderStatus.waiting).length;

          final orders = switch (_filter) {
            _OrdersFilter.debt => allOrders.where((o) => o.amountRemaining > 0).toList(),
            _OrdersFilter.waiting =>
              allOrders.where((o) => o.status == OrderStatus.waiting).toList(),
            _OrdersFilter.all => allOrders,
          };

          return Column(
            children: [
              _SummaryBar(
                total: allOrders.length,
                debt: debtOrders,
                waiting: waitingOrders,
                selected: _filter,
                onSelect: (f) => setState(() => _filter = f),
              ),
              Expanded(
                child: orders.isEmpty
                    ? const Center(child: Text('لا توجد طلبيات مطابقة'))
                    : ListView.separated(
                        padding: const EdgeInsets.all(12),
                        itemCount: orders.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, i) => _OrderCard(order: orders[i]),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Small tappable stats strip — total/debt/waiting counts double as filter
/// buttons, so the same numbers the doctor glances at also narrow the list.
class _SummaryBar extends StatelessWidget {
  const _SummaryBar({
    required this.total,
    required this.debt,
    required this.waiting,
    required this.selected,
    required this.onSelect,
  });

  final int total;
  final int debt;
  final int waiting;
  final _OrdersFilter selected;
  final ValueChanged<_OrdersFilter> onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Row(
        children: [
          Expanded(
            child: _SummaryChip(
              label: 'الإجمالي',
              value: total,
              color: AppTheme.primary,
              selected: selected == _OrdersFilter.all,
              onTap: () => onSelect(_OrdersFilter.all),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _SummaryChip(
              label: 'متأخر عليّ',
              value: debt,
              color: AppTheme.danger,
              selected: selected == _OrdersFilter.debt,
              onTap: () => onSelect(_OrdersFilter.debt),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _SummaryChip(
              label: 'قيد الانتظار',
              value: waiting,
              color: AppTheme.warning,
              selected: selected == _OrdersFilter.waiting,
              onTap: () => onSelect(_OrdersFilter.waiting),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  const _SummaryChip({
    required this.label,
    required this.value,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final int value;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected ? color.withOpacity(0.12) : Colors.transparent,
          border: Border.all(color: selected ? color : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text('$value',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16, color: color)),
            const SizedBox(height: 2),
            Text(label,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade700)),
          ],
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    final o = order;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (o.createdAt != null) Text(_dateFormat.format(o.createdAt!)),
                const Spacer(),
                _StatusChip(status: o.status),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              o.itemsSummary,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (o.discountRate > 0) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(_currency.format(o.displaySubtotal),
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12)),
                  const SizedBox(width: 8),
                  TierDiscountBadge(
                    tier: tierForDiscountRate(o.discountRate),
                    rate: o.discountRate,
                  ),
                ],
              ),
            ],
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الإجمالي: ${_currency.format(o.totalAmount)}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                if (o.amountRemaining > 0)
                  Text('متبقي: ${_currency.format(o.amountRemaining)}',
                      style: const TextStyle(color: AppTheme.danger))
                else
                  const Text('مدفوع بالكامل', style: TextStyle(color: AppTheme.success)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      OrderStatus.waiting => ('انتظار', AppTheme.warning),
      OrderStatus.inProgress => ('جاري', AppTheme.primary),
      OrderStatus.completed => ('مكتمل', AppTheme.success),
      OrderStatus.cancelled => ('ملغي', AppTheme.danger),
      _ => (status, Colors.grey),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}
