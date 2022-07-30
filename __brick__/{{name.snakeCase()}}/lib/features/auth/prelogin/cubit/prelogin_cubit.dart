import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:{{name.snakeCase()}}/core/validation/validation.dart';

part 'prelogin_state.dart';

/// {@template login_cubit}
/// Business logic handler for the login flow.
///
/// {@endtemplate}
class PreloginCubit extends Cubit<PreloginState> {
  /// macro login_cubit
  PreloginCubit(this._authService) : super(const PreloginState());

  final AuthService _authService;

  /// Observes when the email input has changed
  /// and automatically validates and updates the state.
  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email]),
      ),
    );
  }

  /// Initiates the login flow by sending the user a verification code to the
  /// email provided.
  ///
  /// If the email/account combination does not exist then it should return an
  /// exception.
  Future<void> sendVerificationCode() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authService.logOut();
      await _authService.logIn(
        email: state.email.value,
      );
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
