import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTheme {
  static final cardTheme = CardThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  static const navigationBarTheme = const NavigationBarThemeData(elevation: 0);

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        cardTheme: cardTheme,
        navigationBarTheme: navigationBarTheme,
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ),
        cardTheme: cardTheme,
        navigationBarTheme: navigationBarTheme,
      );
}
