import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{name.snakeCase()}}/core/theme/colors.dart';

/// Helper class for using themes.
abstract class AppThemes {
  /// Light Theme for the app
  static final light = ThemeData(
    primarySwatch: AppColors.blueSwatch,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.baseText,
      ),
      displayMedium: TextStyle(
        color: AppColors.baseText,
      ),
      displaySmall: TextStyle(
        color: AppColors.baseText,
      ),
      headlineMedium: TextStyle(
        color: AppColors.baseText,
      ),
      headlineSmall: TextStyle(
        color: AppColors.baseText,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.baseText,
      ),
      bodyLarge: TextStyle(
        color: AppColors.baseText,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: AppColors.baseText,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        color: AppColors.baseText,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.brandBlue,
        minimumSize: const Size.fromHeight(40),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.brandBlue,
        minimumSize: const Size.fromHeight(40),
        side: BorderSide(
          color: AppColors.brandBlue,
        ),
      ),
    ),
  );

  /// Dark Theme
  static final dark = ThemeData(
    primarySwatch: AppColors.blueSwatch,
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
