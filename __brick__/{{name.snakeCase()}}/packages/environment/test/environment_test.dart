import 'package:environment/environment.dart';
import 'package:test/test.dart';

void main() {
  test('has default value for: {{name.constantCase()}}_APP_NAME', () {
    expect(EnvironmentConfig.appName, isNotNull);
  });

  test('has default value for: {{name.constantCase()}}_API_VERSION', () {
    expect(EnvironmentConfig.apiVersion, isNotNull);
  });

  test('has default value for: {{name.constantCase()}}_API_URL', () {
    expect(EnvironmentConfig.apiUrl, isNotNull);
  });

  test('correctly builds BASE_URL', () {
    expect(EnvironmentConfig.baseUrl, isNotNull);
  });
}
