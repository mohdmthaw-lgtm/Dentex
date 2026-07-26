import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/supplier.dart';
import '../../../services/firebase/service_providers.dart';

/// Shared by both the shipment-level "supplier/exporter" field and each
/// item's "manufacturer" field — same underlying Suppliers registry, picked
/// independently per field so one shipment can hold goods from several
/// different factories under one freight supplier.
Future<String?> pickSupplier(BuildContext context) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    builder: (_) => const _SupplierPickerSheet(),
  );
}

class _SupplierPickerSheet extends ConsumerStatefulWidget {
  const _SupplierPickerSheet();

  @override
  ConsumerState<_SupplierPickerSheet> createState() => _SupplierPickerSheetState();
}

class _SupplierPickerSheetState extends ConsumerState<_SupplierPickerSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _addNew() async {
    final name = _searchController.text.trim();
    if (name.isEmpty) return;
    final supplier = await ref.read(supplierRepositoryProvider).getOrCreate(name);
    if (mounted) Navigator.pop(context, supplier.name);
  }

  @override
  Widget build(BuildContext context) {
    final suppliersStream = ref.watch(supplierRepositoryProvider).watchSuppliers();
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      expand: false,
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('اختر أو أضف مورّد/مصنّع',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'ابحث أو اكتب اسمًا جديدًا',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addNew,
                  tooltip: 'إضافة كمورّد جديد',
                ),
              ),
              onChanged: (v) => setState(() => _query = v.trim()),
              onSubmitted: (_) => _addNew(),
            ),
            Expanded(
              child: StreamBuilder<List<Supplier>>(
                stream: suppliersStream,
                builder: (context, snap) {
                  final suppliers = (snap.data ?? [])
                      .where((s) =>
                          _query.isEmpty ||
                          s.name.toLowerCase().contains(_query.toLowerCase()))
                      .toList();
                  if (suppliers.isEmpty) {
                    return Center(
                      child: Text(
                        _query.isEmpty
                            ? 'لا يوجد موردون مسجلون بعد'
                            : 'لا نتائج — اضغط + لإضافة "$_query"',
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: suppliers.length,
                    itemBuilder: (context, i) => ListTile(
                      title: Text(suppliers[i].name),
                      onTap: () => Navigator.pop(context, suppliers[i].name),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
