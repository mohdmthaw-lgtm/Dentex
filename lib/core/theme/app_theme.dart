import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App is built Arabic-first / RTL (the entire product spec was written in
/// Arabic) — see MaterialApp's `locale`/`supportedLocales` in app.dart for
/// the other half of that decision. Cairo reads cleanly at small sizes for
/// dense dashboard stat tiles, which is most of this app's UI.
class AppTheme {
  AppTheme._();

  static const primary = Color(0xFF4EA5AB);
  static const primaryDark = Color(0xFF2E6365);
  static const success = Color(0xFF16A34A);
  static const warning = Color(0xFFD97706);
  static const danger = Color(0xFFDC2626);
  // Used to give same-shaped tiles a distinct accent (e.g. appointments vs
  // accounting on the doctor dashboard) instead of every card defaulting
  // to the brand teal — see _ManagementTile in doctor_dashboard_screen.dart.
  // Each accent is also carried through its whole section's screens (see
  // e.g. patients_list_screen.dart), not just its dashboard tile.
  static const info = Color(0xFF3B82F6);
  static const accent = Color(0xFF7C3AED);
  static const surfaceLight = Color(0xFFF8FAFC);
  static const surfaceDark = Color(0xFF0F172A);

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: primary,
      scaffoldBackgroundColor: surfaceLight,
    );
    return base.copyWith(
      textTheme: GoogleFonts.cairoTextTheme(base.textTheme),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: surfaceLight,
        foregroundColor: Colors.black87,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  static ThemeData dark() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: primary,
      scaffoldBackgroundColor: surfaceDark,
    );
    return base.copyWith(
      textTheme: GoogleFonts.cairoTextTheme(base.textTheme),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
