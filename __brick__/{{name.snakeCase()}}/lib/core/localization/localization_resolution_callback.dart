import 'package:flutter/material.dart';

/// Locale resolution callback.
///
/// Determines what locale should be loaded.
Locale resolutionCallback(Locale? locale, Iterable<Locale> supportedLocales) {
  if (locale == null) {
    // If the locale of the device is not defined, use the first one
    // from the list (English, in this case).
    return supportedLocales.first;
  } else {
    for (final supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }
    // If the locale of the device is not supported, use the first one
    // from the list (English, in this case).
    return supportedLocales.first;
  }
}
