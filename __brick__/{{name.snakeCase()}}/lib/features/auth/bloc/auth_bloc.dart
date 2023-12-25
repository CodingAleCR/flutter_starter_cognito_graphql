import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// {@template auth_bloc}
/// Global authentication BLoC. Provides an API to access current session
/// information like the user in session or use general authentication features
/// like the usual login, logout and register flows.
/// {@endtemplate}
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  /// macro auth_bloc
  AuthenticationBloc({
    required AuthService authService,
  })  : _authService = authService,
        super(const AuthenticationState.unknown()) {
    _userSubscription = _authService.user
        .listen((user) => add(AuthenticationUserChanged(user)));

    on<AuthenticationEvent>(_onAuthEvent, transformer: sequential());
  }

  final AuthService _authService;
  late StreamSubscription<User?> _userSubscription;

  void _onAuthEvent(
    AuthenticationEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    if (event is AuthenticationUserChanged) {
      if (event.user != null) {
        emit(AuthenticationState.authenticated(event.user!));
      } else {
        emit(const AuthenticationState.unauthenticated());
      }
    }
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    await _authService.close();
    await super.close();
  }

  /// Helper to sign out users
  Future<void> signOut() async {
    await _authService.logOut();
  }
}
