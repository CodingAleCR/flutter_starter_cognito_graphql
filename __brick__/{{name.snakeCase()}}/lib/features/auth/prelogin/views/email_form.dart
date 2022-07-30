import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:{{name.snakeCase()}}/core/localization/localization.dart';
import 'package:{{name.snakeCase()}}/core/widgets/widgets.dart';
import 'package:{{name.snakeCase()}}/features/auth/prelogin/cubit/prelogin_cubit.dart';

/// {@template email_form}
/// Email form.
///
/// First step of the login process, prompts the user for their email.
///
/// {@endtemplate}
class EmailForm extends StatelessWidget {
  /// macro email_form
  const EmailForm({Key? key}) : super(key: key);

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
          AppLocalizations.string(context, Strings.loginEmailFormGreeting),
          style: textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          AppLocalizations.string(context, Strings.loginEmailFormMessage),
          style: textTheme.bodyText2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.string(context, Strings.labelEmail),
            style: textTheme.caption?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const _EmailInput(),
        const SizedBox(height: 32),
        const _SubmitButton(),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreloginCubit, PreloginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('emailForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<PreloginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          enabled: state.status != FormzStatus.submissionInProgress,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            isDense: true,
            errorText: state.email.invalid
                ? AppLocalizations.string(context, Strings.emailInvalid)
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
    return BlocBuilder<PreloginCubit, PreloginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == FormzStatus.submissionInProgress
            ? const Center(child: CircularProgressIndicator())
            : FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: state.status.isValidated
                      ? () =>
                          context.read<PreloginCubit>().sendVerificationCode()
                      : null,
                  child: Text(
                    AppLocalizations.string(
                      context,
                      Strings.loginEmailFormSubmitAction,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
