import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/firestore_paths.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/shipment.dart';
import '../../../services/firebase/service_providers.dart';

final _dateFormat = DateFormat.yMMMd('ar');

const statusLabels = {
  ShipmentStatus.preparing: 'قيد التجهيز',
  ShipmentStatus.readyToShip: 'جاهزة للشحن',
  ShipmentStatus.inTransit: 'في الطريق',
  ShipmentStatus.received: 'تم استلامها',
};

const statusColors = {
  ShipmentStatus.preparing: Colors.grey,
  ShipmentStatus.readyToShip: AppTheme.warning,
  ShipmentStatus.inTransit: AppTheme.primary,
  ShipmentStatus.received: AppTheme.success,
};

class ShipmentsListScreen extends ConsumerStatefulWidget {
  const ShipmentsListScreen({super.key});

  @override
  ConsumerState<ShipmentsListScreen> createState() => _ShipmentsListScreenState();
}

class _ShipmentsListScreenState extends ConsumerState<ShipmentsListScreen> {
  String _query = '';
  String? _statusFilter;

  @override
  Widget build(BuildContext context) {
    final shipmentsStream =
        ref.watch(shipmentRepositoryProvider).watchShipments(status: _statusFilter);

    return Scaffold(
      appBar: AppBar(title: const Text('إدارة الشحنات')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/admin/shipments/new'),
        icon: const Icon(Icons.add),
        label: const Text('شحنة جديدة'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'ابحث برقم الشحنة أو اسم المورد...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (v) => setState(() => _query = v.trim()),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _FilterChip(
                  label: 'الكل',
                  selected: _statusFilter == null,
                  onTap: () => setState(() => _statusFilter = null),
                ),
                for (final s in ShipmentStatus.all)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: _FilterChip(
                      label: statusLabels[s]!,
                      selected: _statusFilter == s,
                      onTap: () => setState(() => _statusFilter = s),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: StreamBuilder<List<Shipment>>(
              stream: shipmentsStream,
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snap.hasError) {
                  return Center(child: Text('تعذر تحميل الشحنات: ${snap.error}'));
                }
                final shipments = (snap.data ?? [])
                    .where((s) =>
                        _query.isEmpty ||
                        s.shipmentNumber.contains(_query) ||
                        s.supplierName.toLowerCase().contains(_query.toLowerCase()))
                    .toList();
                if (shipments.isEmpty) {
                  return const Center(child: Text('لا توجد شحنات بعد'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 80),
                  itemCount: shipments.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) => _ShipmentCard(shipment: shipments[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.selected, required this.onTap});
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: AppTheme.primary.withOpacity(0.15),
    );
  }
}

class _ShipmentCard extends StatelessWidget {
  const _ShipmentCard({required this.shipment});
  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    final currencySymbol = shipment.currency == 'USD' ? '\$' : '₪';
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/admin/shipments/${shipment.id}'),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    shipment.shipmentType == ShipmentType.air
                        ? Icons.flight_takeoff
                        : Icons.directions_boat_filled,
                    color: AppTheme.primary,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(shipment.shipmentNumber,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: statusColors[shipment.status]!.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(statusLabels[shipment.status] ?? shipment.status,
                        style: TextStyle(
                            color: statusColors[shipment.status], fontSize: 11)),
                  ),
                ],
              ),
              if (shipment.supplierName.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(shipment.supplierName,
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (shipment.expectedArrivalDate != null)
                    Text('الوصول المتوقع: ${_dateFormat.format(shipment.expectedArrivalDate!)}',
                        style: Theme.of(context).textTheme.bodySmall),
                  Text('$currencySymbol ${shipment.totalCost.toStringAsFixed(0)}',
                      style: const TextStyle(fontWeight: FontWeight.w600, color: AppTheme.primary)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
