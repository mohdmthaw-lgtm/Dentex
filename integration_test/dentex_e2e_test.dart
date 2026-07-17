// End-to-end verification against the REAL Firebase project (dentex-fede7):
// admin login (Firebase Auth + custom claim), a Firestore read (dashboard
// stats/activity feed), and a Firestore write + read-back (creating a
// product and seeing it in the list). Run with:
//   flutter test integration_test/dentex_e2e_test.dart -d <device-id>
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:dentex/app.dart';
import 'package:dentex/firebase_options.dart';

Future<void> _waitFor(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 20),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 300));
    if (finder.evaluate().isNotEmpty) return;
  }
  fail('Timed out waiting for $finder');
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('admin logs in and can read/write Firestore', (tester) async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    await tester.pumpWidget(const ProviderScope(child: DentexApp()));
    await tester.pumpAndSettle();

    // --- Login (admin/admin shortcut -> real seeded admin credentials) ---
    final fields = find.byType(TextFormField);
    expect(fields, findsNWidgets(2));
    await tester.enterText(fields.at(0), 'admin');
    await tester.enterText(fields.at(1), 'admin');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    await tester.tap(find.text('دخول'));
    await tester.pump();

    // Role-based redirect + dashboard stat/activity Firestore reads.
    await _waitFor(tester, find.text('المنتجات'));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    debugPrint('[E2E] Logged in as admin, dashboard rendered — Auth + Firestore read OK');

    // --- Firestore write + read-back: create a throwaway test product ---
    await tester.tap(find.text('المنتجات'));
    await _waitFor(tester, find.text('إضافة منتج'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('إضافة منتج'));
    await _waitFor(tester, find.text('اسم المنتج'));
    await tester.pumpAndSettle();

    final testProductName =
        'E2E Test Product ${DateTime.now().millisecondsSinceEpoch}';
    await tester.enterText(find.widgetWithText(TextFormField, 'اسم المنتج'), testProductName);
    await tester.enterText(
        find.widgetWithText(TextFormField, 'سعر التكلفة'), '10');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'سعر البيع'), '20');
    await tester.enterText(find.widgetWithText(TextFormField, 'الكمية'), '5');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'المواصفة (مثال: مقاس M)'), 'Default');
    await tester.pumpAndSettle();

    await tester.tap(find.text('حفظ'));
    await _waitFor(tester, find.text(testProductName), timeout: const Duration(seconds: 25));
    debugPrint('[E2E] Product "$testProductName" created and visible in list — Firestore write + read-back OK');

    expect(find.text(testProductName), findsOneWidget);
  });
}
