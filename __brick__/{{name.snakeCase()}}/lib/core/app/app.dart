import 'package:domain/domain.dart';
import 'package:environment/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:{{name.snakeCase()}}/core/localization/localization.dart';
import 'package:{{name.snakeCase()}}/core/theme/theme.dart';
import 'package:{{name.snakeCase()}}/features/features.dart';

/// {@template app}
/// {{name.pascalCase()}} app.
///
/// {@endtemplate}
class {{name.pascalCase()}}App extends StatelessWidget {
  /// {@macro app}
  const {{name.pascalCase()}}App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthenticationBloc(
            authService: context.read<AuthService>(),
          ),
        ),
      ],
      child: const AppView(),
    );
  }
}

/// {@template app_state}
/// State for the [{{name.pascalCase()}}App].
///
/// This is necessary in order to correctfully inject global BLOCs and use them
/// in the app widget directly.
/// {@endtemplate}
class AppView extends StatefulWidget {
  /// {@macro app_state}
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  AppViewState createState() => AppViewState();
}

/// State representation for AppView
class AppViewState extends State<AppView> {
  bool _isConfigured = false;

  final _navigatorKey = GlobalKey<NavigatorState>();

  /// Global navigator state to be used within the global app state.
  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  void initState() {
    super.initState();

    // Ensures that you have `context` available for use.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isConfigured) return;

      _initConfigs();
    });
  }

  Future<void> _initConfigs() async {
    final configService = context.read<ConfigService>();

    // Initialize configs
    try {
      await configService.initialize();

      setState(() {
        _isConfigured = true;
      });
    } on InitializationFailure {
      // Good place to monitor crashes on initialization with
      // telemetry services.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      themeMode: ThemeMode.light,
      supportedLocales: const [
        Locale('en'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: resolutionCallback,
      title: EnvironmentConfig.appName,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      builder: _isConfigured
          ? (context, child) {
              return BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  switch (state.status) {
                    case AuthenticationStatus.authenticated:
                      _navigator?.pushAndRemoveUntil<void>(
                        HomePage.route(),
                        (route) => false,
                      );
                    case AuthenticationStatus.unauthenticated:
                      _navigator?.pushAndRemoveUntil<void>(
                        PreloginPage.route(),
                        (route) => false,
                      );

                    case AuthenticationStatus.unknown:
                      _navigator?.pushAndRemoveUntil<void>(
                        SplashPage.route(),
                        (route) => false,
                      );
                  }
                },
                child: child,
              );
            }
          : null,
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
