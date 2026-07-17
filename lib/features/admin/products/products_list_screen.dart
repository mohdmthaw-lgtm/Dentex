import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../models/product.dart';
import '../../../services/firebase/service_providers.dart';

final _currency =
    NumberFormat.currency(locale: 'ar', symbol: 'ر.س', decimalDigits: 0);

class ProductsListScreen extends ConsumerWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsStream = ref.watch(productRepositoryProvider).watchProducts();

    return Scaffold(
      appBar: AppBar(title: const Text('المنتجات')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/admin/products/new'),
        icon: const Icon(Icons.add),
        label: const Text('إضافة منتج'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: productsStream,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final products = snap.data ?? [];
          if (products.isEmpty) {
            return const Center(child: Text('لا توجد منتجات بعد'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) => _ProductCard(product: products[i]),
          );
        },
      ),
    );
  }
}

class _ProductCard extends ConsumerWidget {
  const _ProductCard({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minPrice = product.variantSummaries.isEmpty
        ? null
        : product.variantSummaries.map((v) => v.sellPrice).reduce((a, b) => a < b ? a : b);
    final maxPrice = product.variantSummaries.isEmpty
        ? null
        : product.variantSummaries.map((v) => v.sellPrice).reduce((a, b) => a > b ? a : b);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/admin/products/${product.id}'),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 64,
                  height: 64,
                  child: product.imageUrl.isEmpty
                      ? Container(
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.inventory_2_outlined,
                              color: Colors.grey),
                        )
                      : CachedNetworkImage(
                          imageUrl: product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(
                      'الكمية: ${product.totalQuantity}'
                      '${product.variantSummaries.length > 1 ? ' (${product.variantSummaries.length} مواصفات)' : ''}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    if (minPrice != null)
                      Text(
                        minPrice == maxPrice
                            ? _currency.format(minPrice)
                            : '${_currency.format(minPrice)} - ${_currency.format(maxPrice)}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppTheme.primary, fontWeight: FontWeight.w600),
                      ),
                    if (product.isOutOfStock)
                      const _Badge(text: 'نفذ من المخزون', color: AppTheme.danger)
                    else if (product.isLowStock)
                      const _Badge(text: 'مخزون منخفض', color: AppTheme.warning),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) async {
                  if (value == 'edit') {
                    if (context.mounted) context.push('/admin/products/${product.id}');
                  } else if (value == 'delete') {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (c) => AlertDialog(
                        title: const Text('حذف المنتج'),
                        content: Text('هل أنت متأكد من حذف "${product.name}"؟'),
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
                          .read(productRepositoryProvider)
                          .deleteProduct(product.id);
                    }
                  }
                },
                itemBuilder: (c) => const [
                  PopupMenuItem(value: 'edit', child: Text('تعديل')),
                  PopupMenuItem(value: 'delete', child: Text('حذف')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 11)),
    );
  }
}
