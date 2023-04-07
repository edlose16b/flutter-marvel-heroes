import 'package:marvel/src/domain/entities/story.dart';
import 'package:marvel/src/utils.dart';

/// {@template story_model}
/// Story model for the data layer.
/// {@endtemplate}
///
class StoryModel extends Story {
  /// {@macro story_model}
  StoryModel({
    required super.id,
    required super.title,
    required super.description,
    required super.type,
    required super.modified,
    super.thumbnail,
  });

  /// fromJson to convert from json to [StoryModel]
  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      modified: DateTime.parse(json['modified'] as String),
      thumbnail:
          thumbnailJsonToString(json['thumbnail'] as Map<String, dynamic>?),
    );
  }
}
