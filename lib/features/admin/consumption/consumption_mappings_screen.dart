import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/consumption_mapping.dart';
import '../../../models/patient.dart';
import '../../../models/product.dart';
import '../../../models/product_variant.dart';
import '../../../services/firebase/service_providers.dart';

/// /admin/consumption-mappings — "الربط التجاري": admin tells the app
/// which product/variant a given treatment type uses up (e.g. "قناة جذر" →
/// "غوتا بيركا", 2 لكل علاج). This is global catalog data, not something
/// each doctor configures — Dentex knows its own products. Every doctor
/// reads the full list to compute their own reorder suggestions from their
/// own recorded visits/orders — see reorder_suggestions.dart and
/// create_order_screen.dart's _ReorderSuggestionsBanner.
class ConsumptionMappingsScreen extends ConsumerWidget {
  const ConsumptionMappingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(consumptionMappingRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ربط العلاجات بالمنتجات')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addMapping(context, ref),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<ConsumptionMapping>>(
        stream: repo.watchAllMappings(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final mappings = snap.data ?? [];
          if (mappings.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  'اربط كل نوع علاج بالمنتج المرتبط فيه، وراح يقترح التطبيق على الأطباء إعادة الطلب تلقائيًا بناءً على استخدامهم الفعلي.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: mappings.length,
            itemBuilder: (context, i) {
              final m = mappings[i];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: const Icon(Icons.link, color: AppTheme.primary),
                  title: Text(
                      '${TreatmentType.labels[m.treatmentType] ?? m.treatmentType} ← ${m.productName} (${m.variantLabel})'),
                  subtitle: Text('${m.quantityPerTreatment} لكل علاج'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: AppTheme.danger),
                    onPressed: () => repo.deleteMapping(m.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _addMapping(BuildContext context, WidgetRef ref) async {
    final products = await ref.read(productRepositoryProvider).watchProducts(activeOnly: true).first;
    if (!context.mounted) return;
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (c) => _AddMappingSheet(products: products),
    );
  }
}

class _AddMappingSheet extends ConsumerStatefulWidget {
  const _AddMappingSheet({required this.products});
  final List<Product> products;

  @override
  ConsumerState<_AddMappingSheet> createState() => _AddMappingSheetState();
}

class _AddMappingSheetState extends ConsumerState<_AddMappingSheet> {
  String _treatmentType = TreatmentType.rootCanal;
  Product? _product;
  VariantSummary? _variant;
  final _qtyController = TextEditingController(text: '1');
  bool _saving = false;

  @override
  void dispose() {
    _qtyController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final product = _product;
    final variant = _variant;
    if (product == null || variant == null) return;
    setState(() => _saving = true);
    try {
      final uid = ref.read(authServiceProvider).currentUser!.uid;
      await ref.read(consumptionMappingRepositoryProvider).createMapping(
            treatmentType: _treatmentType,
            productId: product.id,
            productName: product.name,
            variantId: variant.variantId,
            variantLabel: variant.label,
            quantityPerTreatment: num.tryParse(_qtyController.text) ?? 1,
            createdByUid: uid,
          );
      if (mounted) Navigator.pop(context);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('ربط جديد', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _treatmentType,
              decoration: const InputDecoration(labelText: 'نوع العلاج'),
              items: TreatmentType.all
                  .map((t) => DropdownMenuItem(value: t, child: Text(TreatmentType.labels[t]!)))
                  .toList(),
              onChanged: (v) => setState(() => _treatmentType = v ?? TreatmentType.other),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<Product>(
              initialValue: _product,
              decoration: const InputDecoration(labelText: 'المنتج'),
              items: widget.products
                  .map((p) => DropdownMenuItem(value: p, child: Text(p.name)))
                  .toList(),
              onChanged: (v) => setState(() {
                _product = v;
                _variant = null;
              }),
            ),
            const SizedBox(height: 12),
            if (_product != null)
              DropdownButtonFormField<VariantSummary>(
                initialValue: _variant,
                decoration: const InputDecoration(labelText: 'الشكل/العبوة'),
                items: _product!.variantSummaries
                    .map((v) => DropdownMenuItem(value: v, child: Text(v.label)))
                    .toList(),
                onChanged: (v) => setState(() => _variant = v),
              ),
            const SizedBox(height: 12),
            TextField(
              controller: _qtyController,
              decoration: const InputDecoration(labelText: 'الكمية المستهلكة لكل علاج'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: (_product == null || _variant == null || _saving) ? null : _save,
              child: _saving
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('حفظ الربط'),
            ),
          ],
        ),
      ),
    );
  }
}
