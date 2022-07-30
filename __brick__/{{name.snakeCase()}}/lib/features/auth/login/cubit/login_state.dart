part of 'login_cubit.dart';

/// {@template login_state}
/// Represents the state for login cubit.
///
/// {@endtemplate}
class LoginState extends Equatable {
  /// macro login_state
  const LoginState({
    this.code = const MinLengthInput.pure(),
    this.status = FormzStatus.pure,
    this.resendCodeStatus = ResendCodeStatus.idle,
  });

  /// Contains code input information.
  final MinLengthInput code;

  /// Contains code form information.
  final FormzStatus status;

  /// Contains code form information.
  final ResendCodeStatus resendCodeStatus;

  @override
  List<Object> get props => [
        code,
        status,
        resendCodeStatus,
      ];

  /// Provides a cloned instance.
  LoginState copyWith({
    MinLengthInput? code,
    FormzStatus? status,
    ResendCodeStatus? resendCodeStatus,
  }) {
    return LoginState(
      code: code ?? this.code,
      status: status ?? this.status,
      resendCodeStatus: resendCodeStatus ?? this.resendCodeStatus,
    );
  }
}
