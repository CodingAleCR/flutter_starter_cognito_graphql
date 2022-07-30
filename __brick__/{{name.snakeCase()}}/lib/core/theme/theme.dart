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
      headline1: TextStyle(
        color: AppColors.baseText,
      ),
      headline2: TextStyle(
        color: AppColors.baseText,
      ),
      headline3: TextStyle(
        color: AppColors.baseText,
      ),
      headline4: TextStyle(
        color: AppColors.baseText,
      ),
      headline5: TextStyle(
        color: AppColors.baseText,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: AppColors.baseText,
      ),
      bodyText1: TextStyle(
        color: AppColors.baseText,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        color: AppColors.baseText,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      caption: TextStyle(
        color: AppColors.baseText,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
        primary: AppColors.brandBlue,
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
        minimumSize: const Size.fromHeight(40),
        primary: AppColors.brandBlue,
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
