import 'package:flutter/material.dart';

/// Diamond bur grit (roughness) levels — each tied to a fixed color band,
/// same industry-standard convention as on the physical bur handles
/// (coarsest → finest: black, green, blue, red, yellow). Color is always
/// derived from the chosen roughness, never picked independently, per the
/// reference catalog mockup.
class BurRoughness {
  const BurRoughness({required this.id, required this.label, required this.color});

  final String id;
  final String label;
  final Color color;
}

const List<BurRoughness> burRoughnessLevels = [
  BurRoughness(id: 'super_coarse', label: 'سوبر خشن', color: Color(0xFF1C1C1E)),
  BurRoughness(id: 'coarse', label: 'خشن', color: Color(0xFF2E9E4F)),
  BurRoughness(id: 'medium', label: 'عادي', color: Color(0xFF2F6FE0)),
  BurRoughness(id: 'fine', label: 'ناعم', color: Color(0xFFD23C3C)),
  BurRoughness(id: 'super_fine', label: 'ناعم جداً', color: Color(0xFFE8B522)),
];

BurRoughness? burRoughnessById(String id) {
  for (final r in burRoughnessLevels) {
    if (r.id == id) return r;
  }
  return null;
}
