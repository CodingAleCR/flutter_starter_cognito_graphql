part of 'auth_bloc.dart';

/// Enum to determine the status of authentication
enum AuthenticationStatus {
  /// When an user is logged in.
  authenticated,

  /// When there's no user authenticated.
  unauthenticated,

  /// When the app could not determine the auth status.
  unknown
}

/// Auth Bloc State
class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  /// Sets unknown status
  const AuthenticationState.unknown() : this._();

  /// Convenience Constructor for authenticated status.
  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  /// Convenience Constructor for unauthenticated status.
  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  /// Current authentication status
  final AuthenticationStatus status;

  /// Current user in session
  final User user;

  @override
  List<Object> get props => [
        status,
        user,
      ];
}
