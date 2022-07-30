part of 'prelogin_cubit.dart';

/// {@template login_state}
/// Represents the state for login cubit.
///
/// {@endtemplate}
class PreloginState extends Equatable {
  /// macro login_state
  const PreloginState({
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
  });

  /// Contains email input information.
  final Email email;

  /// Contains form information.
  final FormzStatus status;

  @override
  List<Object> get props => [
        email,
        status,
      ];

  /// Provides a cloned instance.
  PreloginState copyWith({
    Email? email,
    FormzStatus? status,
  }) {
    return PreloginState(
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }
}
