import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Colors.white;
  static const Color text = Colors.redAccent;
  static const Color primary = Colors.redAccent;
  static const Color surface = Colors.white;

  static ThemeData light() {
    final ColorScheme scheme = const ColorScheme.light(
      surface: surface,
      primary: primary,
      onPrimary: Colors.white,
      onSurface: text,
    );

    return ThemeData(
      scaffoldBackgroundColor: background,
      colorScheme: scheme,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: text),
        bodyMedium: TextStyle(color: text),
        bodySmall: TextStyle(color: text),
        titleLarge: TextStyle(color: text),
        titleMedium: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        titleSmall: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        labelLarge: TextStyle(color: text),
        labelMedium: TextStyle(color: text),
        labelSmall: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
      ),
      cardColor: surface,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        labelStyle: TextStyle(color: scheme.onSurface.withOpacity(0.8)),
        hintStyle: TextStyle(color: scheme.onSurface.withOpacity(0.6)),
        prefixIconColor: scheme.onSurface.withOpacity(0.7),
        suffixIconColor: scheme.onSurface.withOpacity(0.7),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: scheme.onSurface.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: scheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: scheme.error, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
