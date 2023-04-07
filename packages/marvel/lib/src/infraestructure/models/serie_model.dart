import 'package:marvel/src/domain/entities/serie.dart';
import 'package:marvel/src/utils.dart';

/// {@template event_model}
/// Serie model for the data layer.
/// {@endtemplate}
class SerieModel extends Serie {
  /// {@macro serie_model}
  SerieModel({
    required super.id,
    required super.title,
    required super.thumbnail,
    required super.startYear,
    required super.endYear,
    required super.rating,
    required super.type,
    required super.modified,
    super.description,
  });

  /// fromJson to convert from json to [SerieModel]
  factory SerieModel.fromJson(Map<String, dynamic> json) {
    return SerieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      thumbnail:
          thumbnailJsonToString(json['thumbnail'] as Map<String, dynamic>?),
      startYear: json['startYear'] as int,
      endYear: json['endYear'] as int,
      rating: json['rating'] as String,
      type: json['type'] as String,
      modified: DateTime.parse(json['modified'] as String),
    );
  }
}
