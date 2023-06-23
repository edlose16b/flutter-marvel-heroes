import 'package:marvelheroes/core/constants.dart';
import 'package:marvelheroes/features/home/logic/heroes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/marvel.dart';

class HeroesCubit extends Cubit<HeroesState> {
  HeroesCubit({required this.charactersRepository})
      : super(
          const HeroesState(
            status: HeroesStatus.initial,
            heroes: [],
            itemsLoading: Constants.heroesPerPage,
          ),
        );
  final CharactersRepository charactersRepository;

  Future<void> loadMore() async {
    if (state.status == HeroesStatus.loading) return;

    emit(
      state.copyWith(
        status: HeroesStatus.loading,
        itemsLoading: Constants.heroesPerPage,
      ),
    );
    final response =
        await charactersRepository.fetchCharacters(offset: state.heroes.length);

    response.fold((l) {
      emit(state.copyWith(status: HeroesStatus.failed));
    }, (r) {
      emit(
        state.copyWith(
          status: HeroesStatus.loaded,
          itemsLoading: 0,
          heroes: [...state.heroes, ...r],
        ),
      );
    });
  }
}
