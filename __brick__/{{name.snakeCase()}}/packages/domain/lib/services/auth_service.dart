import 'package:domain/models/user.dart';

/// {@template auth_service}
/// Authentication service, provides an API into the authentication functions.
///
/// {@endtemplate}
abstract class AuthService {
  /// User stream, whenever user authentication changes this stream should
  /// trigger an update.
  Stream<User?> get user;

  /// Starts user authentication flow by sending a code to the email if the
  /// user exists.
  Future<void> logIn({
    required String email,
  });

  /// Performs user log out.
  Future<void> logOut();

  /// Confirms user login with the code received via email.
  Future<void> verifyCode({
    required String code,
  });

  /// Closes all connections
  Future<void> close();
}

/// Thrown during the login process if a failure occurs.
class AuthFailure implements Exception {
  /// Convenience constructor for cognito errors.
  AuthFailure.cognitoError(this.message);

  /// Convenience constructor for amplify errors.
  AuthFailure.amplifyError(this.message);

  /// Convenience constructor for api errors.
  AuthFailure.apiError(this.message);

  /// Convenience constructor for api errors.
  AuthFailure.notParticipant() : message = 'User is not a participant.';

  /// Convenience constructor for unknown errors.
  AuthFailure.unknownError(this.message);

  /// Message provided by the error.
  String message;

  @override
  String toString() {
    return message;
  }
}
