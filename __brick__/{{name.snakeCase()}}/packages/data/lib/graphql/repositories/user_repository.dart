import 'package:data/extensions/extensions.dart';
import 'package:data/graphql/graphql.dart';
import 'package:domain/domain.dart';

/// GraphQL Repository for accessing users information.
///
/// It uses a lazy singleton initializer.
class UserRepository extends GraphQLRepository<User> {
  UserRepository._privateConstructor();

  static final UserRepository _instance = UserRepository._privateConstructor();

  /// Singleton instance
  static UserRepository get instance => _instance;

  @override
  Future<void> deleteById(String id) {
    // TODO(developer): implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<List<User>> findAll() {
    // TODO(developer): implement findAll
    throw UnimplementedError();
  }

  @override
  Future<User> findById(String id) {
    // TODO(developer): implement findById
    throw UnimplementedError();
  }

  /// Finding a participant by email
  Future<User> findByEmail({
    required String email,
  }) async {
    // Fetching current participant's information
    final response = await APIGraphQL.instance.client.query(
      getParticipantByEmailQuery(email: email),
    );

    // Check response's status
    if (response.hasException) {
      throw GraphQLFailure.unknownError(response.exception!.toString());
    }

    // Parse response to User object.
    final participants = response.data?['participant'] as List;

    // Check if there is at least one participant result
    if (participants.isEmpty) {
      throw GraphQLFailure.notFound('Participant not found for email $email');
    }

    final currentParticipant = participants.first as Map<String, dynamic>;

    return MapToUser.fromMap(currentParticipant);
  }

  @override
  Future<User> save(User model) {
    // TODO(developer): implement save
    throw UnimplementedError();
  }
}
