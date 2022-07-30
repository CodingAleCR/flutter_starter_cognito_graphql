import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:{{name.snakeCase()}}/core/validation/validation.dart';
import 'package:{{name.snakeCase()}}/features/auth/login/cubit/resend_code_status.dart';

part 'login_state.dart';

/// {@template login_cubit}
/// Business logic handler for the login flow.
///
/// {@endtemplate}
class LoginCubit extends Cubit<LoginState> {
  /// macro login_cubit
  LoginCubit(this._authService, this._email) : super(const LoginState());

  final AuthService _authService;

  /// User email input in prelogin.
  final String _email;

  /// Observes when the code input has changed
  /// and automatically validates and updates the state.
  void codeChanged(String value) {
    final code = MinLengthInput.dirty(minLength: 6, value: value);
    emit(
      state.copyWith(
        code: code,
        status: Formz.validate([code]),
      ),
    );
  }

  /// Ends login flow by confirming the verification code received via email.
  ///
  /// If the code does not match with the one sent to the user then it should
  /// return an exception.
  Future<void> verifyCode() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authService.verifyCode(code: state.code.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    } finally {
      emit(state.copyWith(status: FormzStatus.valid));
    }
  }

  /// Initiates the login flow by sending the user a verification code to the
  /// email provided.
  ///
  /// If the email/account combination does not exist then it should return an
  /// exception.
  Future<void> resendVerificationCode() async {
    emit(state.copyWith(resendCodeStatus: ResendCodeStatus.inProgress));
    try {
      await _authService.logOut();
      await _authService.logIn(
        email: _email,
      );

      emit(
        state.copyWith(
          resendCodeStatus: ResendCodeStatus.success,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          resendCodeStatus: ResendCodeStatus.failure,
        ),
      );
    } finally {
      emit(
        state.copyWith(
          resendCodeStatus: ResendCodeStatus.idle,
        ),
      );
    }
  }
}
