import 'package:voltway_mobile/configs/theme/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Colors.blue,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.white),
        checkColor: MaterialStateProperty.all(Colors.black),
      ),
      cupertinoOverrideTheme:
          const CupertinoThemeData(primaryColor: Colors.white),
      scaffoldBackgroundColor: DarkAppPalette.background,
      appBarTheme: AppBarTheme(
          backgroundColor: DarkAppPalette.background,
          surfaceTintColor: DarkAppPalette.background,
          foregroundColor: DarkAppPalette.textColor));

  static final lightTheme = ThemeData.light().copyWith(
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.blue,
      ),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(Colors.black),
          checkColor: MaterialStateProperty.all(Colors.white)),
      cupertinoOverrideTheme:
          const CupertinoThemeData(primaryColor: Colors.white),
      inputDecorationTheme:
          InputDecorationTheme(fillColor: LightAppPalette.inputBackground),
      scaffoldBackgroundColor: LightAppPalette.background,
      appBarTheme: AppBarTheme(
          backgroundColor: LightAppPalette.background,
          surfaceTintColor: LightAppPalette.background,
          foregroundColor: LightAppPalette.textColor));

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
