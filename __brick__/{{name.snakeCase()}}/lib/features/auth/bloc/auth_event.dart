part of 'auth_bloc.dart';

/// {@template auth_event}
/// Base event class, you extend this class in order to create
/// new event types.
/// {@endtemplate}
abstract class AuthenticationEvent extends Equatable {
  /// macro authentication_event
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

/// {@template user_changed}
/// Event triggered when the user in session has changed. Usually during login
/// or logout actions.
/// {@endtemplate}
class AuthenticationUserChanged extends AuthenticationEvent {
  /// macro user_changed
  const AuthenticationUserChanged(this.user);

  /// The new user information provided by a source.
  final User? user;

  @override
  List<Object> get props => [];
}
