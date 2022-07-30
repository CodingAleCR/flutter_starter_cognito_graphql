import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:data/amplify/amplify.dart';
import 'package:domain/domain.dart';

/// Implementation of Config Service.
///
/// Used to initialize SDKs
class ConfigServiceImpl extends ConfigService {
  @override
  Future<void> close() async {}

  /// Initialize Amplify
  Future<void> initializeAmplify() async {
    if (Amplify.isConfigured) return;

    final auth = AmplifyAuthCognito();

    await Amplify.addPlugin(auth);

    try {
      await Amplify.configure(amplifyconfig);
    } on Exception {
      throw InitializationFailure();
    }
  }

  /// Initialize configs
  @override
  Future<void> initialize() async {
    await initializeAmplify();
  }
}
