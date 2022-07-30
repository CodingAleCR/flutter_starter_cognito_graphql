import 'package:formz/formz.dart';

/// Possible email validation errors
enum EmailValidationError {
  /// When the string does not match the regular expression.
  invalid
}

/// {@template email_validator}
/// Email validator. Used to store email-like fields
///
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidationError> {
  /// Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  /// Call super.dirty to represent a modified form input.
  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}
