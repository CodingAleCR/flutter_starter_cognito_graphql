import 'package:equatable/equatable.dart';

/// {@template session}
/// Session model
///
/// [Session.empty] represents an unitialized session.
/// {@endtemplate}
class Session extends Equatable {
  /// {@macro session}
  const Session({required this.channelName});

  /// The current session channel name
  final String channelName;

  /// Empty session which represents an unitialized session.
  static const empty = Session(channelName: '');

  @override
  List<Object?> get props => [channelName];
}
