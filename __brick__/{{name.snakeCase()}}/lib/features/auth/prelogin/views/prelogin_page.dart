import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:{{name.snakeCase()}}/core/localization/localization.dart';
import 'package:{{name.snakeCase()}}/features/auth/login/login.dart';
import 'package:{{name.snakeCase()}}/features/auth/prelogin/cubit/prelogin_cubit.dart';
import 'package:{{name.snakeCase()}}/features/auth/prelogin/views/email_form.dart';
import 'package:widgetkit/shared/shared.dart';

/// {@template prelogin_page}
/// Prelogin page. Shown when there is no user in session.
///
/// {@endtemplate}
class PreloginPage extends StatelessWidget {
  /// {@macro prelogin_page}
  const PreloginPage({super.key});

  /// Route creation helper
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const PreloginPage());
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboardOnTouchOutside(
      child: BlocProvider(
        create: (_) => PreloginCubit(
          context.read<AuthService>(),
        ),
        child: const Scaffold(
          body: _Content(),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PreloginCubit, PreloginState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.success) {
          Navigator.push<void>(
            context,
            LoginPage.route(email: state.email.value),
          );
        }

        if (state.status == FormzSubmissionStatus.failure) {
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
      },
      child: const Center(
        child: EmailForm(),
      ),
    );
  }
}
