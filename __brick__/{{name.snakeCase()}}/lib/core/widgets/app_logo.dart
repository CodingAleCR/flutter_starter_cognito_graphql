import 'package:flutter/material.dart';

/// {@template app_logo}
/// {{name.pascalCase()}} Logo widget.
///
/// {@endtemplate}
class AppLogo extends StatelessWidget {
  /// @macro app_logo
  const AppLogo({
    super.key,
    this.lightMode = false,
  });

  /// Displays light version of the logo.
  final bool lightMode;

  @override
  Widget build(BuildContext context) {
    // final variant = lightMode ? 'light' : 'dark';
    return Image.asset(
      'assets/images/logo_icon.png',
      // 'assets/images/logo_icon-$variant.png',
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }
}
