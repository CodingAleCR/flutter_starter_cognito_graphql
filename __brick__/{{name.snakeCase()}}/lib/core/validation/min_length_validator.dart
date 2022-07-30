import 'package:formz/formz.dart';

/// Defines input validation errors
enum MinLengthError {
  /// When the field is empty
  empty,

  /// When the field does not have the set min characters length
  invalid,
}

/// {@template required_text_validator}
/// Extend FormzInput and provide the input type and error type.
///
/// {@endtemplate}
class MinLengthInput extends FormzInput<String, MinLengthError> {
  /// Call super.pure to represent an unmodified form input.
  const MinLengthInput.pure()
      : minLength = 1,
        super.pure('');

  /// Call super.dirty to represent a modified form input.
  const MinLengthInput.dirty({
    this.minLength = 1,
    String value = '',
  }) : super.dirty(value);

  /// Refers to the minimal length of characters allowed.
  final int minLength;

  // Override validator to handle validating a given input value.
  @override
  MinLengthError? validator(String? value) {
    if (value == null || value.isEmpty == true) {
      return MinLengthError.empty;
    } else if (value.isNotEmpty == true && value.length < minLength) {
      return MinLengthError.invalid;
    }
    return null;
  }
}
