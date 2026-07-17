import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/product.dart';
import '../../../services/firebase/product_repository.dart';
import '../../../services/firebase/service_providers.dart';

class _VariantRow {
  _VariantRow({
    this.id,
    String label = '',
    String sellPrice = '',
    String costPrice = '',
    String quantity = '',
  })  : labelController = TextEditingController(text: label),
        sellPriceController = TextEditingController(text: sellPrice),
        costPriceController = TextEditingController(text: costPrice),
        quantityController = TextEditingController(text: quantity);

  final String? id; // null => not yet persisted
  final TextEditingController labelController;
  final TextEditingController sellPriceController;
  final TextEditingController costPriceController;
  final TextEditingController quantityController;

  num get profit {
    final sell = num.tryParse(sellPriceController.text) ?? 0;
    final cost = num.tryParse(costPriceController.text) ?? 0;
    return sell - cost;
  }

  void dispose() {
    labelController.dispose();
    sellPriceController.dispose();
    costPriceController.dispose();
    quantityController.dispose();
  }
}

/// Add/edit product screen. A product can carry multiple variants/specs
/// (e.g. different size or thickness) — each with its own price/cost/qty —
/// so the form is built around a repeatable variant list rather than a
/// single price field.
class ProductFormScreen extends ConsumerStatefulWidget {
  const ProductFormScreen({super.key, this.productId});

  final String? productId;

  bool get isEditing => productId != null;

  @override
  ConsumerState<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends ConsumerState<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _thresholdController = TextEditingController(text: '10');
  final List<_VariantRow> _variants = [];

  Product? _existingProduct;
  File? _pickedImage;
  bool _loading = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      _loadExisting();
    } else {
      _variants.add(_VariantRow());
    }
  }

  Future<void> _loadExisting() async {
    setState(() => _loading = true);
    final repo = ref.read(productRepositoryProvider);
    final product = await repo.getProduct(widget.productId!);
    if (product == null) {
      if (mounted) setState(() => _loading = false);
      return;
    }
    final variants = await repo.watchVariants(widget.productId!).first;
    _nameController.text = product.name;
    _descriptionController.text = product.description;
    _thresholdController.text = product.lowStockThreshold.toString();
    for (final v in variants) {
      final cost = await repo.getVariantCost(widget.productId!, v.id);
      _variants.add(_VariantRow(
        id: v.id,
        label: v.label,
        sellPrice: v.sellPrice.toString(),
        costPrice: cost.toString(),
        quantity: v.quantity.toString(),
      ));
    }
    if (_variants.isEmpty) _variants.add(_VariantRow());
    if (mounted) {
      setState(() {
        _existingProduct = product;
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _thresholdController.dispose();
    for (final v in _variants) {
      v.dispose();
    }
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _pickedImage = File(picked.path));
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final repo = ref.read(productRepositoryProvider);
      String productId;

      if (widget.isEditing) {
        productId = widget.productId!;
        await repo.updateProductInfo(
          productId: productId,
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim(),
          lowStockThreshold: int.tryParse(_thresholdController.text) ?? 0,
        );
        for (final v in _variants) {
          if (v.id == null) {
            await repo.addVariant(
              productId: productId,
              productName: _nameController.text.trim(),
              variant: NewVariantInput(
                label: v.labelController.text.trim(),
                sellPrice: num.parse(v.sellPriceController.text),
                costPrice: num.parse(v.costPriceController.text),
                quantity: int.parse(v.quantityController.text),
              ),
            );
          } else {
            await repo.updateVariantPrice(
              productId: productId,
              variantId: v.id!,
              sellPrice: num.parse(v.sellPriceController.text),
              costPrice: num.parse(v.costPriceController.text),
            );
          }
        }
      } else {
        productId = await repo.createProduct(
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim(),
          lowStockThreshold: int.tryParse(_thresholdController.text) ?? 0,
          variants: _variants
              .map((v) => NewVariantInput(
                    label: v.labelController.text.trim(),
                    sellPrice: num.parse(v.sellPriceController.text),
                    costPrice: num.parse(v.costPriceController.text),
                    quantity: int.parse(v.quantityController.text),
                  ))
              .toList(),
        );
      }

      if (_pickedImage != null) {
        final url = await ref.read(storageServiceProvider).uploadProductImage(
              productId: productId,
              file: _pickedImage!,
            );
        await repo.updateProductImage(
          productId: productId,
          imageUrl: url,
          imagePath: ref.read(storageServiceProvider).productImagePath(productId),
        );
      }

      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  void _addVariantRow() {
    setState(() => _variants.add(_VariantRow()));
  }

  void _removeVariantRow(int index) {
    if (_variants.length <= 1) return;
    setState(() {
      _variants[index].dispose();
      _variants.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'تعديل المنتج' : 'إضافة منتج'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 120,
                    height: 120,
                    color: Colors.grey.shade200,
                    child: _pickedImage != null
                        ? Image.file(_pickedImage!, fit: BoxFit.cover)
                        : (_existingProduct?.imageUrl.isNotEmpty ?? false)
                            ? CachedNetworkImage(
                                imageUrl: _existingProduct!.imageUrl,
                                fit: BoxFit.cover)
                            : const Icon(Icons.add_a_photo_outlined,
                                size: 32, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'اسم المنتج'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'مطلوب' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'المواصفات / الوصف'),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _thresholdController,
              decoration: const InputDecoration(
                  labelText: 'حد التنبيه للمخزون المنخفض'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text('المواصفات والأسعار',
                    style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                TextButton.icon(
                  onPressed: _addVariantRow,
                  icon: const Icon(Icons.add),
                  label: const Text('إضافة مواصفة'),
                ),
              ],
            ),
            ...List.generate(_variants.length, (i) => _buildVariantCard(i)),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _saving ? null : _save,
              style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16)),
              child: _saving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white))
                  : const Text('حفظ'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantCard(int index) {
    final v = _variants[index];
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: v.labelController,
                    decoration: const InputDecoration(
                        labelText: 'المواصفة (مثال: مقاس M)'),
                    validator: (val) =>
                        (val == null || val.trim().isEmpty) ? 'مطلوب' : null,
                  ),
                ),
                if (_variants.length > 1)
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: AppTheme.danger),
                    onPressed: () => _removeVariantRow(index),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: v.costPriceController,
                    decoration: const InputDecoration(labelText: 'سعر التكلفة'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (_) => setState(() {}),
                    validator: (val) =>
                        num.tryParse(val ?? '') == null ? 'رقم غير صحيح' : null,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: v.sellPriceController,
                    decoration: const InputDecoration(labelText: 'سعر البيع'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (_) => setState(() {}),
                    validator: (val) =>
                        num.tryParse(val ?? '') == null ? 'رقم غير صحيح' : null,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: v.quantityController,
                    decoration: const InputDecoration(labelText: 'الكمية'),
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        int.tryParse(val ?? '') == null ? 'رقم غير صحيح' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'الربح: ${v.profit.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: AppTheme.success, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
