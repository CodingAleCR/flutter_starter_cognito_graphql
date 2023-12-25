import 'package:formz/formz.dart';

/// Defines input validation errors
enum RequiredTextError {
  /// When the field is empty
  empty
}

/// {@template required_text_validator}
/// Extend FormzInput and provide the input type and error type.
///
/// {@endtemplate}
class RequiredTextInput extends FormzInput<String, RequiredTextError> {
  /// Call super.pure to represent an unmodified form input.
  const RequiredTextInput.pure() : super.pure('');

  /// Call super.dirty to represent a modified form input.
  const RequiredTextInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  RequiredTextError? validator(String? value) {
    return value?.isNotEmpty ?? false ? null : RequiredTextError.empty;
  }
}
