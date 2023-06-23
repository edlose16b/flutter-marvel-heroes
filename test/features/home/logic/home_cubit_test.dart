import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:marvelheroes/core/constants.dart';
import 'package:marvelheroes/features/home/logic/heroes_cubit.dart';
import 'package:marvelheroes/features/home/logic/heroes_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/marvel.dart';
import 'package:mocktail/mocktail.dart';

class MockCharactersRepository extends Mock implements CharactersRepository {}

void main() {
  late CharactersRepository repository;

  setUp(() {
    repository = MockCharactersRepository();
  });

  blocTest<HeroesCubit, HeroesState>(
    'initial state should be initial',
    build: () => HeroesCubit(charactersRepository: repository),
    verify: (bloc) {
      expect(bloc.state, isA<HeroesState>());
      expect(bloc.state.status, HeroesStatus.initial);
    },
  );

  blocTest<HeroesCubit, HeroesState>(
    'should emits [loading] when call [loadMore]',
    build: () => HeroesCubit(charactersRepository: repository),
    setUp: () {
      when(() => repository.fetchCharacters(offset: 0)).thenAnswer(
        (_) async => const Right([]),
      );
    },
    act: (bloc) {
      bloc.loadMore();
    },
    expect: () => [
      equals(
        const HeroesState(
          heroes: [],
          itemsLoading: Constants.heroesPerPage,
          status: HeroesStatus.loading,
        ),
      ),
      equals(
        const HeroesState(
          heroes: [],
          itemsLoading: 0,
          status: HeroesStatus.loaded,
        ),
      ),
    ],
    verify: (bloc) {
      expect(bloc.state.status, HeroesStatus.loaded);
      verify(() => repository.fetchCharacters(offset: 0)).called(1);
    },
  );

  blocTest<HeroesCubit, HeroesState>(
    'should emits [failed] when call [loadMore]',
    build: () => HeroesCubit(charactersRepository: repository),
    setUp: () {
      when(() => repository.fetchCharacters(offset: 0)).thenAnswer(
        (_) async => Left(ServerFailure()),
      );
    },
    act: (bloc) {
      bloc.loadMore();
    },
    expect: () => [
      equals(
        const HeroesState(
          heroes: [],
          itemsLoading: Constants.heroesPerPage,
          status: HeroesStatus.loading,
        ),
      ),
      equals(
        const HeroesState(
          heroes: [],
          itemsLoading: Constants.heroesPerPage,
          status: HeroesStatus.failed,
        ),
      ),
    ],
    verify: (bloc) {
      expect(bloc.state.status, HeroesStatus.failed);
      verify(() => repository.fetchCharacters(offset: 0)).called(1);
    },
  );

  blocTest<HeroesCubit, HeroesState>(
    'should not call [fetchCharacters] twice when call is already loading',
    build: () => HeroesCubit(charactersRepository: repository),
    setUp: () {
      when(() => repository.fetchCharacters(offset: 0)).thenAnswer(
        (_) async => const Right([]),
      );
    },
    act: (bloc) {
      bloc
        ..loadMore()
        ..loadMore();
    },
    verify: (bloc) {
      expect(bloc.state.status, HeroesStatus.loaded);
      verify(() => repository.fetchCharacters(offset: 0)).called(1);
    },
  );
}
