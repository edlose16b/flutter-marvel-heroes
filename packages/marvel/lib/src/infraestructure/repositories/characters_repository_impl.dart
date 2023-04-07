import 'package:dartz/dartz.dart';
import 'package:marvel/src/core/failures.dart';
import 'package:marvel/src/domain/entities/character.dart';
import 'package:marvel/src/domain/entities/comic.dart';
import 'package:marvel/src/domain/entities/event.dart';
import 'package:marvel/src/domain/entities/serie.dart';
import 'package:marvel/src/domain/entities/story.dart';
import 'package:marvel/src/domain/repositories/characters_repository.dart';
import 'package:marvel/src/infraestructure/datasources/remote_datasource.dart';

/// {@template characters_repository_implementation}
/// Implementation of [CharactersRepository]
/// {@endtemplate}
class CharactersRepositoryImpl implements CharactersRepository {
  /// {@macro characters_repository_implementation}
  CharactersRepositoryImpl({required CharactersRemoteDataSource dataSource})
      : _dataSource = dataSource;

  final CharactersRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<Character>>> fetchCharacters() async {
    try {
      final response = await _dataSource.fetchCharacters();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Comic>>> fetchComics(int characterId) async {
    final response = await _dataSource.fetchComics(characterId);
    return Right(response);
  }

  @override
  Future<Either<Failure, List<Event>>> fetchEvents(int characterId) async {
    final response = await _dataSource.fetchEvents(characterId);
    return Right(response);
  }

  @override
  Future<Either<Failure, List<Serie>>> fetchSeries(int characterId) async {
    final response = await _dataSource.fetchSeries(characterId);
    return Right(response);
  }

  @override
  Future<Either<Failure, List<Story>>> fetchStories(int characterId) async {
    final response = await _dataSource.fetchStories(characterId);
    return Right(response);
  }
}
