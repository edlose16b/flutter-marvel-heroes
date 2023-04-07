/// {@template story_entity}
/// Story
/// {@endtmeplate}

class Story {
  /// {@macro story_entity}
  Story({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.modified,
    this.thumbnail,
  });

  /// id of the story
  int id;

  /// title of the story
  String title;

  /// description of the story
  String description;

  /// type of the story
  String type;

  /// modified of the story
  DateTime modified;

  /// image of the Story
  String? thumbnail;
}
