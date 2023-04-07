import 'package:equatable/equatable.dart';

/// {@template character}
/// Entity Character of he app
/// {@endtemplate}
class Character extends Equatable {
  /// {@macro character}
  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
  });

  /// id of the character
  final int id;

  /// name of the character
  final String name;

  /// description  of the character
  final String description;

  /// time last modified
  final DateTime modified;

  /// image of the character
  final String? thumbnail;

  @override
  List<Object?> get props => [id, name, description, modified, thumbnail];
}
