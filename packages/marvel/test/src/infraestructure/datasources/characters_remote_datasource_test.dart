import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:marvel/marvel.dart';
import 'package:test/test.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  late CharactersRemoteDataSource dataSource;
  group('Characters Remote Datasource', () {
    setUp(() {
      dio.httpClientAdapter = dioAdapter;
      dataSource = CharactersMarvelDataSource(dio: dioAdapter.dio);
    });

    test('should return a list of characters', () async {
      // arrange

      final responseJson =
          simulateMarvelResponse([characterJson1, characterJson1]);

      dioAdapter.onGet(
        '',
        (server) => server.reply(HttpStatus.ok, responseJson),
      );

      // act
      final response = await dataSource.fetchCharacters();

      // assert

      expect(response.first, equals(characterModel1Mock));
    });
  });
}
