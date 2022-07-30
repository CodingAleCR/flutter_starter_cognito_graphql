import 'package:domain/domain.dart' as domain;

/// Convenience extension to create a domain User from a Map.
extension MapToUser on domain.User {
  /// Creates a new user instance from a Map.
  static domain.User fromMap(Map<String, dynamic> map) {
    return domain.User(
      id: map['id'] as String,
      email: map['email'] as String,
      firstname: map['first_name'] as String,
      lastname: map['last_name'] as String,
      photo: map['profile_photo'] as String?,
      preferredName: map['preferred_name'] as String?,
      namePronunciation: map['name_pronunciation'] as String?,
    );
  }
}
