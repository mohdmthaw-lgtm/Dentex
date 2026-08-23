import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/constants/dental_chart.dart';
import '../../core/theme/app_theme.dart';

/// Anatomical Palmer-notation chart: two U-shaped arches (maxillary on
/// top, mandibular below — matching the reference layout), each tooth
/// drawn as its own tappable crown shape (smooth for incisors/canines,
/// cusped for premolars/molars — see [_ToothShape]) sized by tooth type
/// and positioned along a real arc rather than a flat row of boxes. Tap a
/// tooth to select it — e.g. before opening the add-visit sheet with that
/// tooth pre-filled. [hasHistory] marks which teeth already have at least
/// one recorded visit.
class DentalChartWidget extends StatelessWidget {
  const DentalChartWidget({
    super.key,
    required this.onToothTap,
    this.selectedTooth,
    this.hasHistory = const {},
  });

  final ValueChanged<String> onToothTap;
  final String? selectedTooth;
  final Set<String> hasHistory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          const Text('الفك العلوي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          _ArchDiagram(
            leftQuadrant: DentalChart.upperLeft,
            rightQuadrant: DentalChart.upperRight,
            domeUp: true,
            selectedTooth: selectedTooth,
            hasHistory: hasHistory,
            onToothTap: onToothTap,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(height: 1, width: 320, color: Colors.grey.shade300),
          ),
          _ArchDiagram(
            leftQuadrant: DentalChart.lowerLeft,
            rightQuadrant: DentalChart.lowerRight,
            domeUp: false,
            selectedTooth: selectedTooth,
            hasHistory: hasHistory,
            onToothTap: onToothTap,
          ),
          const Text('الفك السفلي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }
}

// Darker selected-state variant of AppTheme.accent (the patients section's
// color, matching its dashboard tile — see _ManagementTile's doc comment)
// — no separate "accentDark" theme token exists since this is the only
// place two shades of it are needed.
final Color _accentDark = Color.lerp(AppTheme.accent, Colors.black, 0.25)!;

const double _archWidth = 320;
const double _archHeight = 220;
const double _minDiameter = 24;
const double _maxDiameter = 38;
// Vertical distance from the arch's "front teeth" edge (top for the
// maxillary box, bottom for the mandibular one) to that edge's own number
// label — must clear the smallest tooth's radius plus the label's own
// text+underline height, or the front-teeth labels clip outside the box.
const double _frontLabelMargin = 36;

class _ToothSlot {
  const _ToothSlot({
    required this.id,
    required this.paletteIndex,
    required this.center,
    required this.diameter,
    required this.labelCenter,
  });
  final String id;
  // 0 = tooth 1 (smallest, front), 7 = tooth 8 (largest, back).
  final int paletteIndex;
  final Offset center;
  final double diameter;
  final Offset labelCenter;
}

/// Lays 16 teeth (8 per side, mirrored out from the midline) along an
/// elliptical arc — [domeUp] true curves the arch like ∩ (maxillary: front
/// teeth at the top-center, molars drooping down at the outer edges),
/// false curves it like ∪ (mandibular: front teeth at the bottom-center,
/// molars rising at the outer edges). Angle 90° is always the midline;
/// sweeping toward 0°/180° moves outward from tooth 1 to tooth 8.
class _ArchDiagram extends StatelessWidget {
  const _ArchDiagram({
    required this.leftQuadrant,
    required this.rightQuadrant,
    required this.domeUp,
    required this.selectedTooth,
    required this.hasHistory,
    required this.onToothTap,
  });

  final List<String> leftQuadrant;
  final List<String> rightQuadrant;
  final bool domeUp;
  final String? selectedTooth;
  final Set<String> hasHistory;
  final ValueChanged<String> onToothTap;

  List<_ToothSlot> _computeSlots() {
    const ecx = _archWidth / 2;
    const rx = _archWidth / 2 - _maxDiameter / 2 - 22;
    const ry = _archHeight - _frontLabelMargin - _maxDiameter / 2 - 10;
    // Label sits along the exact same radial line from the ellipse center
    // as its own tooth, just further out (larger effective radii) — not a
    // fixed vertical offset. A vertical-only offset drifts away from the
    // tooth toward its neighbor for anything but the front-most teeth,
    // since the arc curves sideways as much as it curves up/down once you
    // move away from the midline.
    const labelPad = 20.0;
    const startDeg = 12.0;
    const endDeg = 168.0;
    const steps = 16;
    // θ=90° (front teeth) sits at the ellipse's own vertical extent from
    // its center; ySign flips which edge of the box that extent points to
    // — up for the maxillary box's top-anchored front teeth, down for the
    // mandibular box's bottom-anchored ones.
    final ySign = domeUp ? -1 : 1;
    final ecy = domeUp ? _frontLabelMargin + ry : _archHeight - _frontLabelMargin - ry;

    final slots = <_ToothSlot>[];
    for (var i = 0; i < steps; i++) {
      final deg = startDeg + (endDeg - startDeg) * i / (steps - 1);
      final rad = deg * math.pi / 180;
      final String id;
      final int paletteIndex; // 0 = tooth 1 (smallest, front), 7 = tooth 8 (largest, back)
      if (i < 8) {
        id = leftQuadrant[7 - i];
        paletteIndex = 7 - i;
      } else {
        id = rightQuadrant[i - 8];
        paletteIndex = i - 8;
      }
      final diameter = _minDiameter + (_maxDiameter - _minDiameter) * (paletteIndex / 7);

      final cosR = math.cos(rad);
      final sinR = math.sin(rad);
      final x = ecx + rx * cosR;
      final y = ecy + ySign * ry * sinR;
      final labelX = ecx + (rx + labelPad) * cosR;
      final labelY = ecy + ySign * (ry + labelPad) * sinR;

      slots.add(_ToothSlot(
        id: id,
        paletteIndex: paletteIndex,
        center: Offset(x, y),
        diameter: diameter,
        labelCenter: Offset(labelX, labelY),
      ));
    }
    return slots;
  }

  @override
  Widget build(BuildContext context) {
    final slots = _computeSlots();

    return SizedBox(
      width: _archWidth,
      height: _archHeight,
      child: Stack(
        // Clip.none: cheap insurance against a label clipping a couple of
        // pixels outside the box rather than fine-tuning margins against
        // every font/text-scale combination.
        clipBehavior: Clip.none,
        children: [
          // Pass 1: every tooth crown, so a later (larger, outer) tooth can
          // never paint over an earlier tooth's number label — the bug the
          // single-pass version had, where circles and labels were
          // interleaved in paint order and adjacent outer teeth are close
          // enough to overlap.
          for (final slot in slots)
            Positioned(
              left: slot.center.dx - slot.diameter / 2,
              top: slot.center.dy - slot.diameter / 2,
              child: _ToothShape(
                paletteIndex: slot.paletteIndex,
                diameter: slot.diameter,
                selected: slot.id == selectedTooth,
                hasHistory: hasHistory.contains(slot.id),
                onTap: () => onToothTap(slot.id),
              ),
            ),
          // Pass 2: every label, always on top.
          for (final slot in slots)
            Positioned(
              left: slot.labelCenter.dx - 14,
              top: slot.labelCenter.dy - 9,
              child: SizedBox(
                width: 28,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DentalChart.palmerNumber(slot.id),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: slot.id == selectedTooth ? _accentDark : Colors.black87,
                      ),
                    ),
                    Container(width: 10, height: 1.4, color: Colors.black54),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// A tappable tooth crown — not a plain circle: incisors/canines
/// (paletteIndex 0-2) get a smooth rounded/oval outline, premolars (3-4)
/// get two shallow cusps, molars (5-7) get three, approximating the
/// reference chart's distinction between smooth front teeth and scalloped
/// back teeth.
class _ToothShape extends StatelessWidget {
  const _ToothShape({
    required this.paletteIndex,
    required this.diameter,
    required this.selected,
    required this.hasHistory,
    required this.onTap,
  });

  final int paletteIndex;
  final double diameter;
  final bool selected;
  final bool hasHistory;
  final VoidCallback onTap;

  int get _cuspCount {
    if (paletteIndex <= 2) return 0;
    if (paletteIndex <= 4) return 2;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: diameter,
        height: diameter,
        child: CustomPaint(
          painter: _ToothPainter(
            cuspCount: _cuspCount,
            fillColor: selected ? AppTheme.accent : Colors.white,
            borderColor: selected ? _accentDark : Colors.grey.shade600,
            borderWidth: selected ? 2.2 : 1.3,
          ),
          child: hasHistory
              ? Center(
                  child: Container(
                    width: diameter * 0.26,
                    height: diameter * 0.26,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected ? Colors.white : AppTheme.warning,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class _ToothPainter extends CustomPainter {
  const _ToothPainter({
    required this.cuspCount,
    required this.fillColor,
    required this.borderColor,
    required this.borderWidth,
  });

  final int cuspCount;
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final path = _crownPath(size, cuspCount);
    final fillPaint = Paint()..color = fillColor;
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _ToothPainter oldDelegate) =>
      oldDelegate.cuspCount != cuspCount ||
      oldDelegate.fillColor != fillColor ||
      oldDelegate.borderColor != borderColor ||
      oldDelegate.borderWidth != borderWidth;
}

/// A base circle with [cuspCount] smaller lobes unioned around its rim —
/// 0 cusps reads as a plain smooth crown (incisor/canine), 2-3 reads as a
/// scalloped molar-like crown, without needing a hand-drawn tooth asset.
Path _crownPath(Size size, int cuspCount) {
  final center = Offset(size.width / 2, size.height / 2);
  final baseRadius = size.width / 2 * 0.74;
  var path = Path()..addOval(Rect.fromCircle(center: center, radius: baseRadius));

  if (cuspCount > 0) {
    final cuspRadius = size.width / 2 * 0.34;
    final ringRadius = baseRadius * 0.72;
    for (var i = 0; i < cuspCount; i++) {
      // Spread cusps across the crown's outer (top) half only — a real
      // molar's cusps sit around its occlusal surface, not its root side.
      final angle = math.pi + (math.pi * (i + 1) / (cuspCount + 1));
      final cuspCenter = Offset(
        center.dx + ringRadius * math.cos(angle),
        center.dy + ringRadius * math.sin(angle) * 0.9,
      );
      final cuspPath = Path()..addOval(Rect.fromCircle(center: cuspCenter, radius: cuspRadius));
      path = Path.combine(PathOperation.union, path, cuspPath);
    }
  }
  return path;
}
