import 'package:marvel/src/domain/entities/comic.dart';
import 'package:marvel/src/domain/entities/event.dart';
import 'package:marvel/src/domain/entities/serie.dart';
import 'package:marvel/src/domain/entities/story.dart';
import 'package:marvel/src/infraestructure/models/character_model.dart';

/// Remote Characters Datasource
abstract class CharactersRemoteDataSource {
  /// Fetch all characters
  Future<List<CharacterModel>> fetchCharacters({int? offset});

  /// Fetch comics by character
  Future<List<Comic>> fetchComics(int characterId);

  /// Fetch events by character
  Future<List<Event>> fetchEvents(int characterId);

  /// Fetch series by character
  Future<List<Serie>> fetchSeries(int characterId);

  /// Fetch stories by character
  Future<List<Story>> fetchStories(int characterId);
}
