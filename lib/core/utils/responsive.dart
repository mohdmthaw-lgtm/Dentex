import 'package:flutter/widgets.dart';

/// Scales a phone-tuned grid column count up for wider screens (iPad
/// portrait/landscape) so fixed 2-column grids don't render as an
/// oversized, sparse "phone layout blown up" on tablets.
int responsiveGridColumns(BuildContext context, {int base = 2}) {
  final width = MediaQuery.sizeOf(context).width;
  if (width >= 900) return base * 2;
  if (width >= 600) return base + 1;
  return base;
}
