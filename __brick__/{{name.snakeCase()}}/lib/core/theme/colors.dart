import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/core/extensions/extensions.dart';

/// Helper class that contains all custom colors for the app.
abstract class AppColors {
  /// Brand Colors

  /// Brand Blue
  static Color brandBlue = HexColor.fromHex('#4400FF');

  /// Brand Green
  static Color brandCyan = HexColor.fromHex('#7AE7C7');

  /// Brand Yellow
  static Color brandYellow = HexColor.fromHex('#2D3047');

  /// Shades

  /// Brand blue shade 1
  static Color blueTint1 = HexColor.fromHex('#C7B3FF');

  /// Brand blue shade 1
  static Color blueTint2 = HexColor.fromHex('#E3D9FF');

  /// Neutrals

  /// Grey 1
  static Color grey1 = HexColor.fromHex('#6B6B6B');

  /// Grey 2
  static Color grey2 = HexColor.fromHex('#E3E3E3');

  /// Base Text
  static Color baseText = HexColor.fromHex('#2D3047');

  /// Brand Grey Swatch
  static final MaterialColor blueSwatch = FromColor.fromColor(brandBlue);
}
