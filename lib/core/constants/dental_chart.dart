/// Palmer Notation System (per the reference chart): each tooth is
/// numbered 1-8 outward from the midline within its own quadrant, and a
/// bracket symbol marks which quadrant. We store/route each tooth as a
/// plain string id "<quadrant><1-8>" (e.g. "UR3") — URL-safe, sortable,
/// and directly carries both pieces Palmer notation needs, without
/// depending on a bracket glyph rendering consistently everywhere the id
/// is used as plain text (chat-style titles, Firestore field, route
/// segment).
class DentalChart {
  DentalChart._();

  static const quadrantUpperRight = 'UR';
  static const quadrantUpperLeft = 'UL';
  static const quadrantLowerRight = 'LR';
  static const quadrantLowerLeft = 'LL';

  static List<String> _quadrant(String q) => List.generate(8, (i) => '$q${i + 1}');

  static List<String> get upperRight => _quadrant(quadrantUpperRight);
  static List<String> get upperLeft => _quadrant(quadrantUpperLeft);
  static List<String> get lowerRight => _quadrant(quadrantLowerRight);
  static List<String> get lowerLeft => _quadrant(quadrantLowerLeft);

  static const _quadrantLabelsAr = {
    quadrantUpperRight: 'الفك العلوي الأيمن',
    quadrantUpperLeft: 'الفك العلوي الأيسر',
    quadrantLowerRight: 'الفك السفلي الأيمن',
    quadrantLowerLeft: 'الفك السفلي الأيسر',
  };

  /// Palmer's own digit for a tooth id, e.g. "UR3" -> "3" (what actually
  /// gets written inside the bracket symbol on a real chart).
  static String palmerNumber(String toothId) => toothId.substring(2);

  static String quadrantOf(String toothId) => toothId.substring(0, 2);

  /// "الفك العلوي الأيمن، السن 3" — used anywhere a tooth id needs to read
  /// as a sentence (bottom-sheet titles, app bar titles) rather than the
  /// bare id.
  static String arabicLabel(String toothId) {
    final quadrant = _quadrantLabelsAr[quadrantOf(toothId)] ?? '';
    return '$quadrant، السن ${palmerNumber(toothId)}';
  }
}
