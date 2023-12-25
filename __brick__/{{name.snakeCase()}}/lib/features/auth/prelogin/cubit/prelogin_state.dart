part of 'prelogin_cubit.dart';

/// {@template login_state}
/// Represents the state for login cubit.
///
/// {@endtemplate}
class PreloginState extends Equatable with FormzMixin {
  /// macro login_state
  const PreloginState({
    this.email = const Email.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  /// Contains email input information.
  final Email email;

  /// Contains form information.
  final FormzSubmissionStatus status;

  @override
  List<Object> get props => [
        email,
        status,
      ];

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [
        email,
      ];

  /// Provides a cloned instance.
  PreloginState copyWith({
    Email? email,
    FormzSubmissionStatus? status,
  }) {
    return PreloginState(
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }
}
