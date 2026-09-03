import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light(
    Color primaryColor,
  ) {
    return ThemeData(
      useMaterial3: true,

      colorScheme:
          ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData dark(
    Color primaryColor,
  ) {
    return ThemeData(
      useMaterial3: true,

      colorScheme:
          ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
    );
  }
}