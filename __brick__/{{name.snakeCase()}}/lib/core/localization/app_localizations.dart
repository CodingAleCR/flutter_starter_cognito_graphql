import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{name.snakeCase()}}/core/localization/localization_error.dart';

/// {@template app_localizations}
/// Localization information for the app.
///
/// {@endtemplate}
class AppLocalizations {
  /// macro app_localizations
  AppLocalizations(this.locale);

  /// Current Locale
  final Locale locale;

  /// Helper method to keep the code in the widgets concise
  /// Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations of(BuildContext context) {
    final localizations =
        Localizations.of<AppLocalizations>(context, AppLocalizations);

    if (localizations == null) {
      throw LocalizationException(
        'AppLocalizations not found in buildContext. '
        'Please make sure localizations is properly setup.',
        reason: LocalizationExceptionReason.invalidContext,
      );
    }

    return localizations;
  }

  /// Convenience helper to access
  static String string(BuildContext context, String key) {
    return of(context).translate(key);
  }

  late Map<String, String> _localizedStrings;

  /// Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// Loads the language JSON file from the "lang" folder
  Future<bool> load() async {
    final jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((String key, dynamic value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  /// This method will be called from every widget which needs a localized text
  String translate(String key) {
    if (!_localizedStrings.containsKey(key)) {
      throw LocalizationException(
        'The key selected is not valid. Please check the [locale].json '
        'file and verify that it exists.',
        reason: LocalizationExceptionReason.invalidKey,
      );
    }

    return _localizedStrings[key]!;
  }
}

/// LocalizationsDelegate is a factory for a set of localized resources
/// In this case, the localized strings will be gotten in an
/// AppLocalizations object.
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  /// This delegate instance will never change (it doesn't even have fields!)
  /// It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
