import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/firestore_paths.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/order.dart';
import '../../../services/firebase/service_providers.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: 'ر.س', decimalDigits: 0);
final _dateFormat = DateFormat.yMMMd('ar');

class MyOrdersScreen extends ConsumerWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(authServiceProvider).currentUser?.uid;
    if (uid == null) return const SizedBox.shrink();

    final ordersStream = ref.watch(orderRepositoryProvider).watchOrdersForDoctor(uid);

    return Scaffold(
      appBar: AppBar(title: const Text('طلبياتي')),
      body: StreamBuilder<List<Order>>(
        stream: ordersStream,
        builder: (context, snap) {
          final orders = snap.data ?? [];
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (orders.isEmpty) {
            return const Center(child: Text('لا توجد طلبيات بعد'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: orders.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final o = orders[i];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (o.createdAt != null)
                            Text(_dateFormat.format(o.createdAt!)),
                          const Spacer(),
                          _StatusChip(status: o.status),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        o.items
                            .map((i) => '${i.productName} (${i.variantLabel}) x${i.quantity}')
                            .join('، '),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
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
                            const Text('مدفوع بالكامل',
                                style: TextStyle(color: AppTheme.success)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
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
