/// {@template config_service}
/// Configuration service, provides a way to initialize global configurations
/// that are needed accross the app.
///
/// {@endtemplate}
abstract class ConfigService {
  /// Initializes configuration for the app, specially for 3rd party services
  /// like Amplify, Agora, etc.
  Future<void> initialize();

  /// Closes all connections
  Future<void> close();
}

/// Thrown if a failure occurs while initializing.
class InitializationFailure implements Exception {}
