import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/core/widgets/widgets.dart';

/// {@template rotating_template}
/// Rotating logo from assets.
///
/// {@endtemplate}
class RotatingLogo extends StatefulWidget {
  /// @macro rotating_template
  const RotatingLogo({
    super.key,
  });

  @override
  RotatingLogoState createState() => RotatingLogoState();
}

/// State representation for RotatingLogo
class RotatingLogoState extends State<RotatingLogo> {
  /// Current rotation angle of the logo.
  double currentAngle = 0;
  late Timer _rotatingTimer;

  @override
  void initState() {
    super.initState();

    _rotatingTimer = Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) => _rotateLogo(),
    );
  }

  @override
  void dispose() {
    _rotatingTimer.cancel();
    super.dispose();
  }

  void _rotateLogo() {
    setState(() {
      if (currentAngle == 360) {
        currentAngle = 0;
      } else {
        currentAngle += 0.5 * pi / 360;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: currentAngle,
      child: const AppLogo(),
    );
  }
}
