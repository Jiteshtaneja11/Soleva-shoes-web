import 'package:flutter/material.dart';

class SolevaTheme {
  static const ink = Color(0xFF111111);
  static const warmWhite = Color(0xFFF5F3EE);
  static const orange = Color(0xFFFF5C35);
  static const lime = Color(0xFFCBFF3D);
  static const muted = Color(0xFF777772);

  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: orange,
      brightness: Brightness.light,
      surface: warmWhite,
      primary: ink,
      secondary: orange,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: warmWhite,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 76,
          height: .9,
          fontWeight: FontWeight.w900,
          letterSpacing: -5,
        ),
        headlineLarge: TextStyle(
          fontSize: 44,
          height: 1,
          fontWeight: FontWeight.w800,
          letterSpacing: -2,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          letterSpacing: -1,
        ),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        bodyLarge: TextStyle(fontSize: 16, height: 1.5),
        bodyMedium: TextStyle(fontSize: 14, height: 1.45),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: warmWhite,
        foregroundColor: ink,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: ink,
          foregroundColor: Colors.white,
          minimumSize: const Size(150, 52),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ink,
          minimumSize: const Size(150, 52),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          side: const BorderSide(color: ink),
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
