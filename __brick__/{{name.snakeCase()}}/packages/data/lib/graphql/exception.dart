/// Thrown during the login process if a failure occurs.
class GraphQLFailure implements Exception {
  /// Convenience constructor for cognito errors.
  GraphQLFailure.notFound(this.message) : type = GraphQLFailureType.notFound;

  /// Convenience constructor for unknown errors.
  GraphQLFailure.unknownError(this.message) : type = GraphQLFailureType.unknown;

  /// Message provided by the error.
  GraphQLFailureType type;

  /// Message provided by the error.
  String message;

  @override
  String toString() {
    return message;
  }
}

/// Type for GraphQL Failures
enum GraphQLFailureType {
  /// For simulating 404 behaviors.
  notFound,

  /// For unhandled error types.
  unknown,
}
