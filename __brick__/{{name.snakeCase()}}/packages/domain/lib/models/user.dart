// ignore_for_file: unused_element

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
@freezed
sealed class User with _$User {
  /// {@macro user}
  const factory User({
    required String id,
    required String email,
    required String firstname,
    required String lastname,
    String? photo,
    String? namePronunciation,
    String? preferredName,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Represents an unauthenticated user.
  static const empty = User(id: '', email: '', firstname: '', lastname: '');

  /// Convenience getter for the user's display name
  String get displayName =>
      preferredName != null ? preferredName! : '$firstname $lastname';
}
