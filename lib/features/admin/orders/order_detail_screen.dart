import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/firestore_paths.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/order.dart';
import '../../../services/firebase/service_providers.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: '₪', decimalDigits: 0);
final _dateFormat = DateFormat.yMMMd('ar').add_jm();

class OrderDetailScreen extends ConsumerWidget {
  const OrderDetailScreen({super.key, required this.orderId});
  final String orderId;

  static const _statusLabels = {
    OrderStatus.waiting: 'انتظار',
    OrderStatus.inProgress: 'جاري',
    OrderStatus.completed: 'مكتمل',
    OrderStatus.cancelled: 'ملغي',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderRepo = ref.watch(orderRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل الطلبية')),
      body: StreamBuilder<Order?>(
        stream: orderRepo.watchOrder(orderId),
        builder: (context, snap) {
          final order = snap.data;
          if (order == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.doctorNameSnapshot,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      Text(order.doctorPhoneSnapshot,
                          style: Theme.of(context).textTheme.bodyMedium),
                      if (order.createdAt != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(_dateFormat.format(order.createdAt!),
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: order.status,
                        decoration: const InputDecoration(labelText: 'حالة الطلب'),
                        items: _statusLabels.entries
                            .map((e) => DropdownMenuItem(
                                value: e.key, child: Text(e.value)))
                            .toList(),
                        onChanged: (status) {
                          if (status != null) {
                            orderRepo.updateStatus(orderId: order.id, status: status);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text('المنتجات', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              ...order.itemGroups.map((group) => group.offerName != null
                  ? Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ExpansionTile(
                        leading: const Icon(Icons.local_offer_outlined, color: AppTheme.warning),
                        title: Text('${group.offerName} (بكج)',
                            style: const TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Text(_currency.format(group.lineTotal)),
                        children: group.items
                            .map((item) => ListTile(
                                  title: Text('${item.productName} - ${item.variantLabel}'),
                                  subtitle: Text(
                                      '${item.quantity} × ${_currency.format(item.unitSellPrice)}'),
                                  trailing: Text(_currency.format(item.lineTotal)),
                                ))
                            .toList(),
                      ),
                    )
                  : Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        children: group.items
                            .map((item) => ListTile(
                                  title: Text('${item.productName} - ${item.variantLabel}'),
                                  subtitle: Text(
                                      '${item.quantity} × ${_currency.format(item.unitSellPrice)}'),
                                  trailing: Text(_currency.format(item.lineTotal)),
                                ))
                            .toList(),
                      ),
                    )),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _summaryRow(context, 'الإجمالي', order.totalAmount),
                      _summaryRow(context, 'المدفوع', order.amountPaid,
                          color: AppTheme.success),
                      _summaryRow(context, 'المتبقي', order.amountRemaining,
                          color: order.amountRemaining > 0 ? AppTheme.danger : AppTheme.success),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (order.amountRemaining > 0)
                _RecordPaymentButton(order: order),
              const SizedBox(height: 16),
              Text('سجل الدفعات', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              StreamBuilder<List<Payment>>(
                stream: orderRepo.watchPayments(order.id),
                builder: (context, paySnap) {
                  final payments = paySnap.data ?? [];
                  if (payments.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('لا توجد دفعات مسجلة'),
                    );
                  }
                  return Card(
                    child: Column(
                      children: payments
                          .map((p) => ListTile(
                                leading: const Icon(Icons.payments_outlined),
                                title: Text(_currency.format(p.amount)),
                                subtitle: p.recordedAt != null
                                    ? Text(_dateFormat.format(p.recordedAt!))
                                    : null,
                              ))
                          .toList(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _summaryRow(BuildContext context, String label, num value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Text(_currency.format(value),
              style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}

class _RecordPaymentButton extends ConsumerWidget {
  const _RecordPaymentButton({required this.order});
  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton.icon(
      onPressed: () async {
        final controller = TextEditingController();
        final amount = await showDialog<num>(
          context: context,
          builder: (c) => AlertDialog(
            title: const Text('تسجيل دفعة'),
            content: TextField(
              controller: controller,
              autofocus: true,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'المبلغ (المتبقي ${_currency.format(order.amountRemaining)})',
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(c), child: const Text('إلغاء')),
              FilledButton(
                onPressed: () => Navigator.pop(c, num.tryParse(controller.text)),
                child: const Text('تسجيل'),
              ),
            ],
          ),
        );
        if (amount != null && amount > 0) {
          final uid = ref.read(authServiceProvider).currentUser!.uid;
          await ref.read(orderRepositoryProvider).recordPayment(
                orderId: order.id,
                amount: amount,
                recordedByUid: uid,
              );
        }
      },
      icon: const Icon(Icons.add_card),
      label: const Text('تسجيل دفعة'),
    );
  }
}

