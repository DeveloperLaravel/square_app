import 'package:flutter/material.dart';

class ThemeManager {
  ThemeManager._();

  static final ThemeManager instance =
      ThemeManager._();

  final ValueNotifier<ThemeMode>
      themeModeNotifier =
          ValueNotifier(
    ThemeMode.light,
  );

  final ValueNotifier<Color>
      colorNotifier =
          ValueNotifier(
    Colors.blue,
  );

  ThemeMode get themeMode =>
      themeModeNotifier.value;

  Color get primaryColor =>
      colorNotifier.value;

  void changeThemeMode(
    ThemeMode mode,
  ) {
    themeModeNotifier.value = mode;
  }

  void changeColor(
    Color color,
  ) {
    colorNotifier.value = color;
  }
}