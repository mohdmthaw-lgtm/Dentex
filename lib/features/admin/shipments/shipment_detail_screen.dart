import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/firestore_paths.dart';
import '../../../core/theme/app_theme.dart';
import '../../../models/shipment.dart';
import '../../../services/firebase/service_providers.dart';
import 'shipments_list_screen.dart' show statusLabels;

final _dateFormat = DateFormat.yMMMd('ar');

class ShipmentDetailScreen extends ConsumerStatefulWidget {
  const ShipmentDetailScreen({super.key, required this.shipmentId});
  final String shipmentId;

  @override
  ConsumerState<ShipmentDetailScreen> createState() => _ShipmentDetailScreenState();
}

class _ShipmentDetailScreenState extends ConsumerState<ShipmentDetailScreen> {
  bool _uploadingDoc = false;

  Future<void> _uploadDocument() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null || result.files.single.path == null) return;
    final file = File(result.files.single.path!);
    final originalName = result.files.single.name;

    setState(() => _uploadingDoc = true);
    try {
      final storage = ref.read(storageServiceProvider);
      // Timestamp-prefix the storage filename so re-uploading a file with
      // the same name never overwrites an earlier document.
      final storageFileName = '${DateTime.now().millisecondsSinceEpoch}_$originalName';
      final url = await storage.uploadShipmentDocument(
        shipmentId: widget.shipmentId,
        file: file,
        fileName: storageFileName,
      );
      await ref.read(shipmentRepositoryProvider).addDocument(
            shipmentId: widget.shipmentId,
            document: ShipmentDocument(
              label: originalName,
              url: url,
              path: storage.shipmentDocumentPath(widget.shipmentId, storageFileName),
            ),
          );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('تعذر رفع الملف: $e')));
      }
    } finally {
      if (mounted) setState(() => _uploadingDoc = false);
    }
  }

  Future<void> _receiveShipment(Shipment shipment) async {
    final cartonsController =
        TextEditingController(text: shipment.totalCartons.toString());
    final notesController = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('استلام الشحنة'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: cartonsController,
              decoration: const InputDecoration(labelText: 'عدد الكراتين المستلمة'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(labelText: 'ملاحظات'),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('إلغاء')),
          FilledButton(onPressed: () => Navigator.pop(c, true), child: const Text('تأكيد الاستلام')),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(shipmentRepositoryProvider).receiveShipment(
            shipmentId: widget.shipmentId,
            receivedCartons: int.tryParse(cartonsController.text) ?? 0,
            receivingNotes: notesController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final shipmentStream = ref.watch(shipmentRepositoryProvider).watchShipment(widget.shipmentId);

    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل الشحنة')),
      body: StreamBuilder<Shipment?>(
        stream: shipmentStream,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('تعذر تحميل الشحنة: ${snap.error}'));
          }
          final shipment = snap.data;
          if (shipment == null) {
            return const Center(child: Text('هذه الشحنة غير موجودة'));
          }
          final symbol = shipment.currency == 'USD' ? '\$' : '₪';

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(shipment.shipmentNumber,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => context.push('/admin/shipments/${shipment.id}/edit'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: AppTheme.danger),
                    onPressed: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (c) => AlertDialog(
                          title: const Text('حذف الشحنة'),
                          content: const Text('هل أنت متأكد من حذف هذه الشحنة؟'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(c, false),
                                child: const Text('إلغاء')),
                            TextButton(
                                onPressed: () => Navigator.pop(c, true),
                                child: const Text('حذف',
                                    style: TextStyle(color: AppTheme.danger))),
                          ],
                        ),
                      );
                      if (confirm == true) {
                        await ref
                            .read(shipmentRepositoryProvider)
                            .deleteShipment(shipment.id);
                        if (context.mounted) context.pop();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Status.
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('حالة الشحنة', style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: shipment.status,
                        items: ShipmentStatus.all
                            .map((s) => DropdownMenuItem(
                                value: s, child: Text(statusLabels[s] ?? s)))
                            .toList(),
                        onChanged: (s) {
                          if (s != null && s != ShipmentStatus.received) {
                            ref
                                .read(shipmentRepositoryProvider)
                                .updateStatus(shipment.id, s);
                          } else if (s == ShipmentStatus.received) {
                            _receiveShipment(shipment);
                          }
                        },
                      ),
                      if (shipment.status != ShipmentStatus.received) ...[
                        const SizedBox(height: 8),
                        OutlinedButton.icon(
                          onPressed: () => _receiveShipment(shipment),
                          icon: const Icon(Icons.inventory_2_outlined),
                          label: const Text('استلام الشحنة'),
                        ),
                      ] else ...[
                        const SizedBox(height: 8),
                        Text(
                          'استُلمت ${shipment.receivedAt != null ? _dateFormat.format(shipment.receivedAt!) : ''} — ${shipment.receivedCartons} كرتون',
                          style: const TextStyle(color: AppTheme.success),
                        ),
                        if (shipment.receivingNotes.isNotEmpty)
                          Text(shipment.receivingNotes,
                              style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Info.
              _SectionCard(title: 'معلومات الشحنة', children: [
                _infoRow('شركة الشحن / التصدير', shipment.supplierName),
                _infoRow('رقم طلب الشراء', shipment.purchaseOrderNumber),
                _infoRow('شركة الشحن', shipment.shippingCompany),
                _infoRow('وكيل الشحن', shipment.shippingAgent),
                _infoRow('نوع الشحن',
                    shipment.shipmentType == ShipmentType.air ? 'جوي' : 'بحري'),
                _infoRow('بلد المنشأ', shipment.originCountry),
                _infoRow('رقم الحاوية', shipment.containerNumber),
                _infoRow('تاريخ الشحن',
                    shipment.shipDate != null ? _dateFormat.format(shipment.shipDate!) : ''),
                _infoRow(
                    'الوصول المتوقع',
                    shipment.expectedArrivalDate != null
                        ? _dateFormat.format(shipment.expectedArrivalDate!)
                        : ''),
              ]),
              const SizedBox(height: 16),

              // Products, grouped by supplier/manufacturer.
              _SectionCard(title: 'المنتجات (${shipment.items.length})', children: [
                for (final group in _groupItemsByManufacturer(shipment.items)) ...[
                  Text(group.manufacturer.isEmpty ? 'بدون مورد محدد' : group.manufacturer,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: AppTheme.primary)),
                  for (final item in group.items)
                    Padding(
                      padding: const EdgeInsets.only(top: 6, right: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.productName,
                                    style: const TextStyle(fontWeight: FontWeight.w600)),
                                Text(
                                    '${item.quantity} قطعة · ${item.cartonCount} كرتون · $symbol ${item.purchasePrice}',
                                    style: Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                          Text('$symbol ${item.lineTotal.toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                ],
                const Divider(),
                _infoRow('إجمالي الكميات', '${shipment.totalQuantity}'),
                _infoRow('إجمالي الكراتين', '${shipment.totalCartons}'),
                _infoRow('إجمالي قيمة المنتجات',
                    '$symbol ${shipment.productsTotal.toStringAsFixed(2)}'),
              ]),
              const SizedBox(height: 16),

              // Costs.
              _SectionCard(title: 'التكاليف', children: [
                _infoRow('تكلفة الشحن', '$symbol ${shipment.costs.shipping}'),
                _infoRow('الجمارك', '$symbol ${shipment.costs.customs}'),
                _infoRow('التخليص', '$symbol ${shipment.costs.clearance}'),
                _infoRow('التخزين', '$symbol ${shipment.costs.storage}'),
                _infoRow('النقل', '$symbol ${shipment.costs.transport}'),
                _infoRow('مصاريف أخرى', '$symbol ${shipment.costs.other}'),
                const Divider(),
                _infoRow('إجمالي تكلفة الشحنة',
                    '$symbol ${shipment.totalCost.toStringAsFixed(2)}',
                    bold: true),
              ]),
              const SizedBox(height: 16),

              // Documents.
              _SectionCard(
                title: 'المستندات',
                trailing: _uploadingDoc
                    ? const SizedBox(
                        height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
                    : IconButton(
                        icon: const Icon(Icons.upload_file, color: AppTheme.primary),
                        onPressed: _uploadDocument,
                        tooltip: 'رفع مستند',
                      ),
                children: [
                  if (shipment.documents.isEmpty)
                    const Text('لا توجد مستندات مرفوعة بعد', style: TextStyle(color: Colors.grey)),
                  for (final doc in shipment.documents)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.insert_drive_file_outlined),
                      title: Text(doc.label, maxLines: 1, overflow: TextOverflow.ellipsis),
                      onTap: () => launchUrl(Uri.parse(doc.url), mode: LaunchMode.externalApplication),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline, color: AppTheme.danger),
                        onPressed: () => ref
                            .read(shipmentRepositoryProvider)
                            .removeDocument(shipmentId: shipment.id, document: doc),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),

              if (shipment.notes.isNotEmpty)
                _SectionCard(title: 'ملاحظات', children: [Text(shipment.notes)]),
            ],
          );
        },
      ),
    );
  }

  /// Groups the flat items list by manufacturer, preserving each
  /// manufacturer's first-appearance order — mirrors how the edit form
  /// organizes products under their supplier.
  List<_ManufacturerGroup> _groupItemsByManufacturer(List<ShipmentItem> items) {
    final groups = <String, _ManufacturerGroup>{};
    final ordered = <_ManufacturerGroup>[];
    for (final item in items) {
      final group = groups.putIfAbsent(item.manufacturer, () {
        final g = _ManufacturerGroup(item.manufacturer);
        ordered.add(g);
        return g;
      });
      group.items.add(item);
    }
    return ordered;
  }

  Widget _infoRow(String label, String value, {bool bold = false}) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.w600,
                  color: bold ? AppTheme.primary : null)),
        ],
      ),
    );
  }
}

class _ManufacturerGroup {
  _ManufacturerGroup(this.manufacturer);
  final String manufacturer;
  final List<ShipmentItem> items = [];
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.children, this.trailing});
  final String title;
  final List<Widget> children;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                const Spacer(),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}
