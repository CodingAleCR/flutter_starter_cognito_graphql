import 'package:equatable/equatable.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    this.photo,
    this.namePronunciation,
    this.preferredName,
  });

  /// Unique Identifier with the form UUID v4.
  final String id;

  /// Standard email address.
  final String email;

  /// The user's first name.
  final String firstname;

  /// The user's lastname.
  final String lastname;

  /// Url for the user's photo.
  final String? photo;

  /// The name/nickname preferred by the user
  final String? preferredName;

  /// The user's pronunciation for the preferred name.
  final String? namePronunciation;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(
    id: '',
    email: '',
    firstname: '',
    lastname: '',
  );

  /// Convenience getter for the user's display name
  String get displayName =>
      preferredName != null ? preferredName! : '$firstname $lastname';

  @override
  List<Object?> get props => [
        email,
        id,
        firstname,
        lastname,
        photo,
        preferredName,
        namePronunciation,
      ];
}
