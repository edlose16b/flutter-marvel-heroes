import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dd3/features/hero/logic/hero_cubit.dart';
import 'package:dd3/features/hero/logic/hero_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/marvel.dart';
import 'package:mocktail/mocktail.dart';

class MockCharactersRepository extends Mock implements CharactersRepository {}

void main() {
  late CharactersRepository repository;
  late Character character;
  late HeroCubit cubit;
  setUp(() {
    repository = MockCharactersRepository();
    character = Character(
      id: 1,
      name: 'name',
      description: 'description',
      modified: DateTime.now(),
      thumbnail: 'thumbnail',
    );
    cubit = HeroCubit(charactersRepository: repository, character: character);
  });

  blocTest<HeroCubit, CharacterState>(
    'initial state should be initial',
    build: () => cubit,
    verify: (bloc) {
      expect(bloc.state, isA<CharacterState>());
      expect(bloc.state.status, equals(CharacterStateStatus.initial));
      verifyNever(() => repository.fetchComics(any()));
    },
  );

  blocTest<HeroCubit, CharacterState>(
    'should calls api when call [fetchData]',
    build: () => cubit,
    setUp: () {
      when(() => repository.fetchComics(any())).thenAnswer(
        (_) async => const Right([]),
      );
      when(() => repository.fetchEvents(any())).thenAnswer(
        (_) async => const Right([]),
      );
      when(() => repository.fetchSeries(any())).thenAnswer(
        (_) async => const Right([]),
      );
      when(() => repository.fetchStories(any())).thenAnswer(
        (_) async => const Right([]),
      );
    },
    act: (bloc) {
      bloc.fetchData();
    },
    verify: (bloc) {
      expect(bloc.state, isA<CharacterState>());
      expect(
        bloc.state,
        CharacterState(
          character: character,
          status: CharacterStateStatus.initial,
          comics: [],
          events: [],
          series: [],
          stories: [],
        ),
      );

      verify(() => repository.fetchComics(any())).called(1);
      verify(() => repository.fetchEvents(any())).called(1);
      verify(() => repository.fetchSeries(any())).called(1);
      verify(() => repository.fetchStories(any())).called(1);
    },
  );
}
