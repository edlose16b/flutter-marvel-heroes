import 'package:dartz/dartz.dart';
import 'package:marvel/src/core/failures.dart';
import 'package:marvel/src/domain/entities/character.dart';
import 'package:marvel/src/domain/entities/comic.dart';
import 'package:marvel/src/domain/entities/event.dart';
import 'package:marvel/src/domain/entities/serie.dart';
import 'package:marvel/src/domain/entities/story.dart';

/// Characters Repository cotnract
abstract class CharactersRepository {
  /// Fetch all characters
  Future<Either<Failure, List<Character>>> fetchCharacters();

  /// Fetch comics by character
  Future<Either<Failure, List<Comic>>> fetchComics(int characterId);

  /// Fetch events by character
  Future<Either<Failure, List<Event>>> fetchEvents(int characterId);

  /// Fetch series by character
  Future<Either<Failure, List<Serie>>> fetchSeries(int characterId);

  /// Fetch stories by character
  Future<Either<Failure, List<Story>>> fetchStories(int characterId);
}
