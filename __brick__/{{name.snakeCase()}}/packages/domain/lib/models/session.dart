import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

/// {@template session}
/// Session model
///
/// [Session.empty] represents an unitialized session.
/// {@endtemplate}
@freezed
sealed class Session with _$Session {
  /// {@macro session}
  const factory Session({required String channelName}) = _Session;

  const Session._();

 factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  /// [Session.empty] represents an unitialized session.
  static const empty = Session(channelName: '');
}
