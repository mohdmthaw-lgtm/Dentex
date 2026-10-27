import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

/// A filter pill, built from scratch rather than Material's ChoiceChip —
/// ChoiceChip's built-in padding/centering doesn't play well with Arabic
/// labels (especially paired with an avatar dot), clipping glyphs and
/// throwing the label off-center. A plain Container+Row sidesteps all of
/// that: we control padding and centering directly. Used for every
/// category/subcategory/roughness filter row (products list, create order,
/// product form).
class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
    this.avatar,
  });

  // A plain string, not a Widget — this chip is only ever a single line of
  // text, and taking a String lets us pin softWrap/maxLines/overflow here
  // in one place rather than trusting every call site to set them.
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;
  final Widget? avatar;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: () => onSelected(!selected),
        child: Container(
          constraints: const BoxConstraints(minHeight: 40),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? AppTheme.primary : Colors.white,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
                color: selected ? AppTheme.primary : Colors.grey.shade300),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (avatar != null) ...[avatar!, const SizedBox(width: 6)],
              Text(
                label,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black87,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
