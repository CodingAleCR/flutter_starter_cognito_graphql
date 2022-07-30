import 'package:data/graphql/graphql.dart';
import 'package:graphql/client.dart';

/// Find a participant by email.
/// ```
/// query GetUserByEmail($vEmail: String) {
///   users(where: {email: {_eq: $vEmail}}) {
///     id
///     email
///     first_name
///     last_name
///     profile_photo
///   }
/// }
/// ```
QueryOptions getParticipantByEmailQuery({
  required String email,
}) =>
    QueryOptions(
      document: gql(getParticipantByEmailDoc),
      variables: <String, dynamic>{
        'vEmail': email,
      },
    );
