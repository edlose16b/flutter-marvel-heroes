// ignore_for_file: public_member_api_docs

/// {@template serie_entity}
/// Serie
/// {@endtmeplate}
class Serie {
  /// {@macro serie_entity}
  Serie({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.startYear,
    required this.endYear,
    required this.rating,
    required this.type,
    required this.modified,
    required this.description,
  });

  int id;
  String title;
  String? description;
  String? thumbnail;
  int startYear;
  int endYear;
  String rating;
  String type;
  DateTime modified;
}
