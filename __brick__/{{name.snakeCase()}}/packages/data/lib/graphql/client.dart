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
      final httpLink = HttpLink(
        '${EnvironmentConfig.baseUrl}/graphql',
      );

      final authLink = AuthLink(getToken: () async => 'Bearer $bearerToken');

      final link = authLink.concat(httpLink);

      client = GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      );
    } on Exception {
      throw InitializationFailure();
    }
  }
}
