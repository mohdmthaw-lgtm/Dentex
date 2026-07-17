import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dentex/features/auth/login_screen.dart';

void main() {
  testWidgets('Login screen renders phone and password fields', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: LoginScreen()),
      ),
    );

    expect(find.text('رقم الهاتف'), findsOneWidget);
    expect(find.text('كلمة السر'), findsOneWidget);
    expect(find.text('دخول'), findsOneWidget);
  });
}
