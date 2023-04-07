import 'package:marvel/src/domain/entities/event.dart';
import 'package:marvel/src/utils.dart';

/// {@template event_model}
/// Event model for the data layer.
/// {@endtemplate}

class EventModel extends Event {
  /// {@macro event_model}
  EventModel({
    required super.id,
    required super.title,
    required super.description,
    required super.thumbnail,
    required super.modified,
    required super.start,
    required super.end,
  });

  /// fromJson to convert from json to [EventModel]
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnail:
          thumbnailJsonToString(json['thumbnail'] as Map<String, dynamic>?),
      modified: DateTime.parse(json['modified'] as String),
      start: json['start'] != null
          ? DateTime.parse(json['start'] as String)
          : null,
      end: json['end'] != null ? DateTime.parse(json['end'] as String) : null,
    );
  }
}
