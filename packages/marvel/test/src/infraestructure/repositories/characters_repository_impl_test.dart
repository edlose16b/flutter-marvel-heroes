import 'package:dartz/dartz.dart';
import 'package:marvel/marvel.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockCharactersRemoteDataSource extends Mock implements CharactersRemoteDataSource {}

void main() {
  late CharactersRepository repository;
  late CharactersRemoteDataSource dataSource;
  group('CharactersRepositoryImpl', () {
    setUp(() {
      dataSource = MockCharactersRemoteDataSource();
      repository = CharactersRepositoryImpl(dataSource: dataSource);
    });

    test('should fetch Caracters', () async {
      // arrange
      final response = [characterModel1Mock];
      when(() => dataSource.fetchCharacters()).thenAnswer(
        (_) async => response,
      );
      // act
      final result = await repository.fetchCharacters();
      // assert

      expect(
        result,
        equals(
          Right<Failure, List<Character>>(response),
        ),
      );
    });
  });
}
