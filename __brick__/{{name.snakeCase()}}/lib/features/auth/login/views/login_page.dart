import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:{{name.snakeCase()}}/core/localization/localization.dart';
import 'package:{{name.snakeCase()}}/features/auth/login/cubit/login_cubit.dart';
import 'package:{{name.snakeCase()}}/features/auth/login/cubit/resend_code_status.dart';
import 'package:{{name.snakeCase()}}/features/auth/login/views/code_form.dart';
import 'package:widgetkit/shared/shared.dart';

/// {@template login_page}
/// Login page. Shown when there is no user in session.
///
/// {@endtemplate}
class LoginPage extends StatelessWidget {
  /// {@macro login_page}
  const LoginPage({required this.email, super.key});

  /// Route creation helper
  static Route<void> route({required String email}) {
    return MaterialPageRoute<void>(
      builder: (_) => LoginPage(email: email),
    );
  }

  /// User email input in prelogin.
  final String email;

  @override
  Widget build(BuildContext context) {
    return HideKeyboardOnTouchOutside(
      child: BlocProvider(
        create: (_) => LoginCubit(
          context.read<AuthService>(),
          email,
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              AppLocalizations.string(
                context,
                Strings.loginCodeFormTitle,
              ),
            ),
          ),
          body: const _Content(),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.resendCodeStatus == ResendCodeStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                AppLocalizations.string(
                  context,
                  Strings.loginCodeFormResendSuccess,
                ),
              ),
            ),
          );
        }
        if (state.resendCodeStatus == ResendCodeStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red[600],
              content: Text(
                AppLocalizations.string(
                  context,
                  Strings.loginSendCodeFailure,
                ),
              ),
            ),
          );
        }

        if (state.status == FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red[600],
              content: Text(
                AppLocalizations.string(
                  context,
                  Strings.loginCodeFormFailure,
                ),
              ),
            ),
          );
        }
      },
      child: const CodeForm(),
    );
  }
}
