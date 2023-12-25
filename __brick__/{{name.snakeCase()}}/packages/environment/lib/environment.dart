/// Environment library.
/// Allows you to share configuration between the different modules.
library environment;

/// Environment configuration.
class EnvironmentConfig {
  /// App name to be displayed in home screen.
  static const appName = String.fromEnvironment(
    '{{name.constantCase()}}_APP_NAME',
    defaultValue: '{{name.titleCase()}}',
  );

  /// Version of the API used in the app.
  static const apiVersion = String.fromEnvironment(
    '{{name.constantCase()}}_API_VERSION',
    defaultValue: '/v1',
  );

  /// URL of the API used in the app.
  static const apiUrl = String.fromEnvironment(
    '{{name.constantCase()}}_API_URL',
    defaultValue: 'http://localhost:3000/api',
  );

  /// URL of the public API used in the app.
  static const publicApiUrl = String.fromEnvironment(
    '{{name.constantCase()}}_PUBLIC_API_URL',
    defaultValue: 'http://',
  );

  /// Base URL constructed to be used in the app.
  static const baseUrl = '$apiUrl$apiVersion';

  ///Amplify
  /// Cognito Identity Region
  static const cognitoIdentityRegion = String.fromEnvironment(
    '{{name.constantCase()}}_COGNITO_IDENTITY_REGION',
    defaultValue: 'region',
  );

  /// Cognito Identity Pool Id
  static const cognitoIdentityPoolId = String.fromEnvironment(
    '{{name.constantCase()}}_COGNITO_IDENTITY_POOL_ID',
    defaultValue: 'identity-pool-id',
  );

  /// Cognito User Pool Id
  static const cognitoUserPoolId = String.fromEnvironment(
    '{{name.constantCase()}}_COGNITO_USER_POOL_ID',
    defaultValue: 'user-pool-id',
  );

  /// Cognito User Pool App Client Id
  static const cognitoUserPoolAppClientId = String.fromEnvironment(
    '{{name.constantCase()}}_COGNITO_USER_POOL_APP_CLIENT_ID',
    defaultValue: 'user-pool-app-client-id',
  );

  /// Cognito User Pool App Client Secret
  static const cognitoUserPoolAppClientSecret = String.fromEnvironment(
    '{{name.constantCase()}}_COGNITO_USER_POOL_APP_CLIENT_SECRET',
    defaultValue: 'user-pool-app-client-secret',
  );

  /// Cognito User Pool Region
  static const cognitoUserPoolRegion = String.fromEnvironment(
    '{{name.constantCase()}}_COGNITO_USER_POOL_REGION',
    defaultValue: 'user-pool-region',
  );

  /// Cognito Auth Flow Type
  static const cognitoAuthFlowType = String.fromEnvironment(
    '{{name.constantCase()}}_COGNITO_AUTH_FLOW_TYPE',
    defaultValue: 'auth-flow-type',
  );
}
