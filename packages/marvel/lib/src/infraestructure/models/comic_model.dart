import 'package:marvel/src/domain/entities/comic.dart';
import 'package:marvel/src/utils.dart';

/// {@template comic_model}
/// Comic model for the data layer.
/// {@endtemplate}
class ComicModel extends Comic {
  /// {@macro comic_model}
  ComicModel({
    required super.id,
    required super.digitalId,
    required super.title,
    required super.issueNumber,
    required super.variantDescription,
    super.description,
    required super.modified,
    required super.thumbnail,
  });

  /// fromJson to convert from json to [ComicModel]
  factory ComicModel.fromJson(Map<String, dynamic> json) {
    return ComicModel(
      id: json['id'] as int,
      digitalId: json['digitalId'] as int,
      title: json['title'] as String,
      issueNumber: json['issueNumber'] as int,
      variantDescription: json['variantDescription'] as String,
      description: json['description'] as String?,
      modified: DateTime.parse(json['modified'] as String),
      thumbnail: thumbnailJsonToString(json['thumbnail'] as Map<String, dynamic>?),
    );
  }
}
