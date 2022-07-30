import 'package:environment/environment.dart';

// ignore_for_file: leading_newlines_in_multiline_strings
/// Amplify Config
const amplifyconfig = ''' {
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0",
  "auth": {
      "plugins": {
          "awsCognitoAuthPlugin": {
              "IdentityManager": {
                  "Default": {}
              },
              "CredentialsProvider": {
                  "CognitoIdentity": {
                      "Default": {
                          "PoolId": "${EnvironmentConfig.cognitoIdentityPoolId}",
                          "Region": "${EnvironmentConfig.cognitoIdentityRegion}"
                      }
                  }
              },
              "CognitoUserPool": {
                  "Default": {
                      "PoolId": "${EnvironmentConfig.cognitoUserPoolId}",
                      "AppClientId": "${EnvironmentConfig.cognitoUserPoolAppClientId}",
                      "AppClientSecret": "${EnvironmentConfig.cognitoUserPoolAppClientSecret}",
                      "Region": "${EnvironmentConfig.cognitoUserPoolRegion}"
                  }
              },
              "Auth": {
                  "Default": {
                      "authenticationFlowType": "${EnvironmentConfig.cognitoAuthFlowType}"
                  }
              }
          }
      }
  }
}''';
