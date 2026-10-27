/// Product catalog taxonomy — admin picks one category per product so
/// doctors can filter the ordering catalog instead of scrolling a flat
/// list. Static/editorial data (not stored in Firestore) since the list
/// itself only changes when the owner redesigns the catalog, same spirit
/// as [tierThresholds] et al. in loyalty_tiers.dart.
class ProductCategory {
  const ProductCategory({required this.id, required this.label});

  final String id;
  final String label;
}

const List<ProductCategory> productCategories = [
  ProductCategory(id: 'root_canal', label: 'علاج العصب'),
  ProductCategory(id: 'burs', label: 'البيرز'),
  ProductCategory(id: 'polishing_finishing', label: 'التلميع والتشطيب'),
  ProductCategory(id: 'anesthesia_injection', label: 'التخدير والحقن'),
  ProductCategory(id: 'sterilization_infection', label: 'التعقيم ومكافحة العدوى'),
  ProductCategory(id: 'daily_consumables', label: 'المستهلكات اليومية'),
  ProductCategory(id: 'impressions', label: 'الطبعات'),
];

ProductCategory? productCategoryById(String id) {
  for (final c in productCategories) {
    if (c.id == id) return c;
  }
  return null;
}

String categoryLabel(String id) => productCategoryById(id)?.label ?? '';
