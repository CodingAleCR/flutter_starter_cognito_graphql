import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:{{name.snakeCase()}}/core/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthServiceImpl()),
        Provider<ConfigService>(create: (_) => ConfigServiceImpl()),
      ],
      child: const TemplateApp(),
    ),
  );
}
