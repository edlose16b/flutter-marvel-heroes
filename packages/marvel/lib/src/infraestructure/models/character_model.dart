import 'package:marvel/src/domain/entities/character.dart';
import 'package:marvel/src/utils.dart';

/// {@template character_model}
/// Character model for the data layer.
/// {@endtemplate}
class CharacterModel extends Character {
  /// {@macro character_model}
  const CharacterModel({
    required super.id,
    required super.name,
    required super.description,
    required super.modified,
    required super.thumbnail,
  });

  /// fromJson to convert from json to [CharacterModel]
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      modified: DateTime.parse(json['modified'] as String),
      thumbnail: thumbnailJsonToString(json['thumbnail'] as Map<String, dynamic>?),
    );
  }
}
