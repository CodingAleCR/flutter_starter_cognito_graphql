import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:data/amplify/amplify.dart';
import 'package:domain/domain.dart';

/// Implementation of Config Service.
///
/// Used to initialize Amplify SDKs
class AmplifyService {
  AmplifyService._privateConstructor();

  static final AmplifyService _instance = AmplifyService._privateConstructor();

  /// Singleton instance for Amplify
  static AmplifyService get instance => _instance;

  /// async method to initialize Amplify
  Future<void> initialize() async {
    if (Amplify.isConfigured) return;

    final auth = AmplifyAuthCognito();

    await Amplify.addPlugins([auth]);

    // Initialize AmplifyFlutter
    try {
      await Amplify.configure(amplifyconfig);
    } on Exception {
      throw InitializationFailure();
    }
  }
}
