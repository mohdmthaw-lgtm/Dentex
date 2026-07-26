import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/firestore_paths.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/order.dart';
import '../../../services/firebase/service_providers.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);
final _dateFormat = DateFormat.yMMMd('ar');

class OrdersListScreen extends ConsumerWidget {
  const OrdersListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersStream = ref.watch(orderRepositoryProvider).watchOrders();

    return Scaffold(
      appBar: AppBar(title: const Text('الطلبات')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/admin/orders/new'),
        icon: const Icon(Icons.add),
        label: const Text('طلبية جديدة'),
      ),
      body: StreamBuilder<List<Order>>(
        stream: ordersStream,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final orders = snap.data ?? [];
          if (orders.isEmpty) {
            return const Center(child: Text('لا توجد طلبات بعد'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: orders.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) => _OrderCard(order: orders[i]),
          );
        },
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/admin/orders/${order.id}'),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(order.doctorNameSnapshot,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                  ),
                  _StatusChip(status: order.status),
                ],
              ),
              const SizedBox(height: 4),
              if (order.createdAt != null)
                Text(_dateFormat.format(order.createdAt!),
                    style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 6),
              Text(
                order.itemsSummary,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(_currency.format(order.totalAmount),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 12),
                  if (order.paymentStatus == PaymentStatus.paid)
                    const _Badge(text: 'مدفوع بالكامل', color: AppTheme.success)
                  else if (order.paymentStatus == PaymentStatus.partial)
                    _Badge(
                        text: 'متبقي ${_currency.format(order.amountRemaining)}',
                        color: AppTheme.warning)
                  else
                    _Badge(
                        text: 'دين ${_currency.format(order.amountRemaining)}',
                        color: AppTheme.danger),
                ],
              ),
            ],
          ),
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
    return _Badge(text: label, color: color);
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}
