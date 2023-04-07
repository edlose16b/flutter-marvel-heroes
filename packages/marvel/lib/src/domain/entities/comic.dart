// ignore_for_file: public_member_api_docs
/// {@template comic_entity}
/// Comic
/// {@endtmeplate}
class Comic {
  /// {@macro comic_entity}
  Comic({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.thumbnail,
  });

  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String? description;
  DateTime modified;
  String? thumbnail;
}
