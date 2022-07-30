/// Localization Exception reason.
///
enum LocalizationExceptionReason {
  /// Unknown error.
  unknown,

  /// Invalid context.
  invalidContext,

  /// Invalid String key.
  invalidKey,
}

/// {@template localization_error}
/// Localization Exception for convenience when displaying errors
/// for strings.
///
/// {@endtemplate}
class LocalizationException implements Exception {
  /// macro localization_error
  LocalizationException(
    this.message, {
    this.reason = LocalizationExceptionReason.unknown,
  });

  /// reason of the exception.
  LocalizationExceptionReason reason;

  /// additional message information.
  String message;
}
