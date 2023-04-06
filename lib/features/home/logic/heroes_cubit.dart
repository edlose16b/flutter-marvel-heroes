import 'package:dd3/core/constants.dart';
import 'package:dd3/features/home/logic/heroes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeroesCubit extends Cubit<HeroesState> {
  HeroesCubit()
      : super(
          const HeroesState(
            status: HeroesStatus.initial,
            heroes: [],
            itemsLoading: Constants.heroesPerPage,
          ),
        );

  Future<void> loadMore() async {
    if (state.status == HeroesStatus.loading) return;
    
    emit(
      state.copyWith(
        status: HeroesStatus.loading,
        itemsLoading: Constants.heroesPerPage,
      ),
    );
    await Future<void>.delayed(const Duration(milliseconds: 3000));
    emit(
      state.copyWith(
        status: HeroesStatus.loaded,
        itemsLoading: 0,
        heroes: [...state.heroes, ...List.filled(20, 1)],
      ),
    );
  }
}

class LoadingsCubit extends Cubit<Map<String, dynamic>> {
  LoadingsCubit(super.initialState);
}
