import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:{{name.snakeCase()}}/core/localization/localization.dart';
import 'package:{{name.snakeCase()}}/core/validation/validation.dart';
import 'package:{{name.snakeCase()}}/core/widgets/widgets.dart';
import 'package:{{name.snakeCase()}}/features/auth/login/cubit/login_cubit.dart';
import 'package:{{name.snakeCase()}}/features/auth/login/cubit/resend_code_status.dart';

/// {@template email_form}
/// Code form.
///
/// First step of the login process, prompts the user for their email.
///
/// {@endtemplate}
class CodeForm extends StatelessWidget {
  /// macro email_form
  const CodeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(48),
      shrinkWrap: true,
      children: [
        const AppLogo(),
        const SizedBox(height: 56),
        Text(
          AppLocalizations.string(context, Strings.loginCodeFormMessage),
          style: textTheme.bodyText2?.copyWith(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.string(context, Strings.labelVerificationCode),
            style: textTheme.caption?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const _CodeInput(),
        const SizedBox(height: 32),
        const _SubmitButton(),
        const SizedBox(height: 64),
        Text(
          AppLocalizations.string(
            context,
            Strings.loginCodeFormResendMessage,
          ),
          textAlign: TextAlign.center,
          style: textTheme.caption?.copyWith(
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        const _ResendCodeButton(),
      ],
    );
  }
}

class _CodeInput extends StatelessWidget {
  const _CodeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.code != current.code,
      builder: (context, state) {
        return TextField(
          key: const Key('codeForm_codeInput_textField'),
          onChanged: (code) => context.read<LoginCubit>().codeChanged(code),
          keyboardType: TextInputType.number,
          maxLength: 6,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          autocorrect: false,
          enabled: state.status != FormzStatus.submissionInProgress,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            isDense: true,
            counter: const Offstage(),
            errorText: state.code.invalid
                ? state.code.error == MinLengthError.empty
                    ? AppLocalizations.string(context, Strings.requiredInvalid)
                    : AppLocalizations.string(context, Strings.minLengthInvalid)
                : null,
          ),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == FormzStatus.submissionInProgress
            ? const Center(child: CircularProgressIndicator())
            : FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: state.status.isValidated
                      ? () => context.read<LoginCubit>().verifyCode()
                      : null,
                  child: Text(
                    AppLocalizations.string(
                      context,
                      Strings.loginCodeFormSubmitAction,
                    ),
                  ),
                ),
              );
      },
    );
  }
}

class _ResendCodeButton extends StatelessWidget {
  const _ResendCodeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.resendCodeStatus != current.resendCodeStatus,
      builder: (context, state) {
        return state.resendCodeStatus == ResendCodeStatus.inProgress
            ? const Center(child: CircularProgressIndicator())
            : FractionallySizedBox(
                widthFactor: 1,
                child: OutlinedButton(
                  onPressed: () =>
                      context.read<LoginCubit>().resendVerificationCode(),
                  child: Text(
                    AppLocalizations.string(
                      context,
                      Strings.loginCodeFormResendAction,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
