import 'package:domain/domain.dart';
import 'package:environment/environment.dart';
import 'package:graphql/client.dart';

/// Implementation of GraphQL client.
///
/// Used to initialize GraphQL
class APIGraphQL {
  APIGraphQL._privateConstructor();

  static final APIGraphQL _instance = APIGraphQL._privateConstructor();

  /// Singleton instance for GraphQL Client
  static APIGraphQL get instance => _instance;

  /// GraphQL Client
  late GraphQLClient client;

  /// async method to initialize GraphQL client
  Future<void> initialize({
    required String bearerToken,
  }) async {
    // Create client
    try {
      final _httpLink = HttpLink(
        '${EnvironmentConfig.baseUrl}/graphql',
      );

      final _authLink = AuthLink(getToken: () async => 'Bearer $bearerToken');

      final _link = _authLink.concat(_httpLink);

      client = GraphQLClient(
        cache: GraphQLCache(),
        link: _link,
      );
    } on Exception {
      throw InitializationFailure();
    }
  }
}
