import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/core/widgets/widgets.dart';

/// {@template splash_page}
/// Splash page. Shown while the app is loading configurations.
///
/// {@endtemplate}
class SplashPage extends StatelessWidget {
  /// {@macro splash_page}
  const SplashPage({Key? key}) : super(key: key);

  /// Route creation helper
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: SizedBox.square(
            dimension: 200,
            child: AppLogo(lightMode: true),
          ),
        ),
      ),
    );
  }
}
