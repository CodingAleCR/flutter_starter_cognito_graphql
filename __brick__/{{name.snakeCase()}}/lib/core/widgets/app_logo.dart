import 'package:flutter/material.dart';

/// {@template app_logo}
/// Placeholder Logo widget.
///
/// {@endtemplate}
class AppLogo extends StatelessWidget {
  /// @macro app_logo
  const AppLogo({
    Key? key,
    this.lightMode = false,
  }) : super(key: key);

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
