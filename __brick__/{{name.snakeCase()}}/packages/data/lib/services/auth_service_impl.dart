import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:data/graphql/graphql.dart';
import 'package:domain/domain.dart';

/// Implementation of Auth Service with Cognito as source of truth.
// ignore_for_file: implicit_dynamic_parameter, avoid_dynamic_calls
class AuthServiceImpl extends AuthService {
  /// macro auth_service_impl
  AuthServiceImpl() {
    _userSubscription = Amplify.Hub.listen([HubChannel.Auth], _onAuthChange);
    _refreshAuthStatus();
  }

  final StreamController<User?> _userController = StreamController();

  late StreamSubscription<HubEvent> _userSubscription;

  void _onAuthChange(HubEvent hubEvent) {
    switch (hubEvent.eventName) {
      case 'SIGNED_IN':
        {
          _authenticated();
        }
        break;
      case 'SIGNED_OUT':
        {
          _unauthenticated();
        }
        break;
    }
  }

  @override
  Stream<User?> get user => _userController.stream;

  @override
  Future<void> close() async {
    await _userController.close();
    await _userSubscription.cancel();
  }

  @override
  Future<void> logIn({required String email}) async {
    try {
      await Amplify.Auth.signIn(
        username: email,
        password: 'dummy',
      );
    } on AuthException catch (e) {
      throw AuthFailure.cognitoError(e.message);
    } on AmplifyException catch (e) {
      throw AuthFailure.amplifyError(e.message);
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      throw AuthFailure.amplifyError(e.message);
    }
  }

  @override
  Future<void> verifyCode({required String code}) async {
    try {
      final response = await Amplify.Auth.confirmSignIn(
        confirmationValue: code,
      );

      if (response.isSignedIn) {
        await _authenticated();
      }
    } on AuthException catch (e) {
      throw AuthFailure.amplifyError(e.message);
    } on Exception {
      throw AuthFailure.unknownError(
        'We could not authenticate your credentials.',
      );
    }
  }

  Future<void> _refreshAuthStatus() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (session.isSignedIn) {
        await _authenticated();
      } else {
        await _unauthenticated();
      }
    } on GraphQLFailure {
      // GraphQL failures can only ocurr after Cognito auth, so
      // we can just avoid any issues by loggin out.
      await logOut();
    } on Exception {
      // For other exceptions that could happen we can just
      // send null to the user's stream via our helper method.
      await _unauthenticated();
    }
  }

  Future<void> _unauthenticated() async {
    _userController.add(null);
  }

  Future<void> _authenticated() async {
    // Fetching user attributes to get the email.
    final attributes = await Amplify.Auth.fetchUserAttributes();
    final email = attributes
        .firstWhere((attribute) => attribute.userAttributeKey.key == 'email')
        .value;

    // Fetching the session to get the id token.
    final session = await Amplify.Auth.fetchAuthSession(
      options: CognitoSessionOptions(getAWSCredentials: true),
    ) as CognitoAuthSession;
    final token = session.userPoolTokens!.idToken;

    // Initializing GraphQL with bearer token.
    await APIGraphQL.instance.initialize(bearerToken: token);

    // Fetching current participant's information.
    final currentParticipant =
        await UserRepository.instance.findByEmail(email: email);

    // Update stream with current participant information.
    _userController.add(currentParticipant);
  }
}
