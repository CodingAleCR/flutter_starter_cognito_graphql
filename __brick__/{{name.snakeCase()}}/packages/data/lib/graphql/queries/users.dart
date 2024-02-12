import 'package:data/graphql/graphql.dart';
import 'package:graphql/client.dart';

/// Find a user by email.
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
QueryOptions getUserByEmailQuery({
  required String email,
}) =>
    QueryOptions(
      document: gql(getUserByEmailDoc),
      variables: <String, dynamic>{
        'vEmail': email,
      },
    );
