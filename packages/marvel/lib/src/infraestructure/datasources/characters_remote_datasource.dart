import 'dart:io';

import 'package:dio/dio.dart';
import 'package:marvel/src/core/failures.dart';
import 'package:marvel/src/domain/entities/comic.dart';
import 'package:marvel/src/domain/entities/event.dart';
import 'package:marvel/src/domain/entities/serie.dart';
import 'package:marvel/src/domain/entities/story.dart';
import 'package:marvel/src/infraestructure/datasources/remote_datasource.dart';
import 'package:marvel/src/infraestructure/dto/marvel_response.dart';
import 'package:marvel/src/infraestructure/models/character_model.dart';
import 'package:marvel/src/infraestructure/models/comic_model.dart';
import 'package:marvel/src/infraestructure/models/event_model.dart';
import 'package:marvel/src/infraestructure/models/serie_model.dart';
import 'package:marvel/src/infraestructure/models/story_model.dart';

/// api uri
const apiUri = 'https://gateway.marvel.com:443/v1/public/characters';

/// {@template characters_marvel_datasource}
/// Implementation for Marvel API
/// {@endtemplate}
class CharactersMarvelDataSource implements CharactersRemoteDataSource {
  /// {@macro characters_marvel_datasource}
  CharactersMarvelDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<CharacterModel>> fetchCharacters() async {
    return _fetchData(
      '',
      (e) => CharacterModel.fromJson(e as Map<String, dynamic>),
    );
  }

  @override
  Future<List<Comic>> fetchComics(int characterId) async {
    return _fetchData(
      '/$characterId/comics',
      (e) => ComicModel.fromJson(e as Map<String, dynamic>),
    );
  }

  @override
  Future<List<Event>> fetchEvents(int characterId) {
    return _fetchData(
      '/$characterId/events',
      (e) => EventModel.fromJson(e as Map<String, dynamic>),
    );
  }

  @override
  Future<List<Serie>> fetchSeries(int characterId) {
    return _fetchData(
      '/$characterId/series',
      (e) => SerieModel.fromJson(e as Map<String, dynamic>),
    );
  }

  @override
  Future<List<Story>> fetchStories(int characterId) {
    return _fetchData(
      '/$characterId/stories',
      (e) => StoryModel.fromJson(e as Map<String, dynamic>),
    );
  }

  Future<List<T>> _fetchData<T>(String uri, T Function(dynamic e) onMap) async {
    final response = await _dio.get<Map<String, dynamic>>(uri);

    try {
      if (response.statusCode != HttpStatus.ok) throw Exception();

      final marvelResponse = MarvelResponse.fromJson(response.data!);

      final results = marvelResponse.data.results as List<dynamic>;

      return results
          .map(
            (dynamic e) => onMap(e),
          )
          .toList();
    } on DioError catch (_) {
      // ignore: only_throw_errors
      throw ServerFailure();
    }
  }
}
