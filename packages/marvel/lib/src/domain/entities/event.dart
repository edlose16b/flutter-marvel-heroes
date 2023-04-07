// ignore_for_file: public_member_api_docs

/// {@template event_entity}
/// Event
/// {@endtmeplate}
///

class Event {
  /// {@macro event_entity}
  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.modified,
    required this.start,
    required this.end,
  });

  int id;
  String title;
  String description;
  String? thumbnail;
  DateTime modified;
  DateTime? start;
  DateTime? end;
}
