import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTheme {
  static final cardTheme = CardThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  static const _selectedLabelStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.primary,
  );

  static const _unselectedLabelStyle = TextStyle(
    fontSize: 12,
    letterSpacing: 0.4,
  );

  static const navigationBarTheme = NavigationBarThemeData(
    elevation: 0,
    // Transparent indicator + overlay removes the M3 pill on both rest and press
    indicatorColor: Colors.transparent,
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
    iconTheme: WidgetStateProperty.fromMap({
      WidgetState.selected: IconThemeData(color: AppColors.primary, size: 24),
      WidgetState.any: IconThemeData(size: 24),
    }),
    labelTextStyle: WidgetStateProperty.fromMap({
      WidgetState.selected: _selectedLabelStyle,
      WidgetState.any: _unselectedLabelStyle,
    }),
  );

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
