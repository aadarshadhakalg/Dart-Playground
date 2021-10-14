import 'package:flutter/material.dart';

extension AppThemeExtension on ThemeData {
  Color get secondaryColor => const Color(0xffee855d);
}

final ColorScheme _appColorScheme = ColorScheme.fromSwatch(
  accentColor: const Color(0xFF426987),
  primarySwatch: const MaterialColor(
    0xFF2a5679,
    <int, Color>{
      50: Color(0xFF2a5679), //10%
      100: Color(0xFF2a5679), //20%
      200: Color(0xFF2a5679), //30%
      300: Color(0xFF2a5679), //40%
      400: Color(0xFF2a5679), //50%
      500: Color(0xFF2a5679), //60%
      600: Color(0xFF2a5679), //70%
      700: Color(0xFF2a5679), //80%
      800: Color(0xFF2a5679), //90%
      900: Color(0xFF2a5679), //100%
    },
  ),
);

ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: _appColorScheme,
  primaryColor: const Color(0xFF2a5679),
  scaffoldBackgroundColor: const Color(0xFFf1f7fe),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith(
        (states) => const Color(0xFFf1f7fe),
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: const Color(0xFF2a5679),
  colorScheme: _appColorScheme,
);
