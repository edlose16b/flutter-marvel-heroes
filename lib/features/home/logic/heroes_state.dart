import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marvel/marvel.dart';

part 'heroes_state.freezed.dart';

enum HeroesStatus { initial, loading, failed, loaded }

@freezed
abstract class HeroesState with _$HeroesState {
  const factory HeroesState({
    required HeroesStatus status,
    required int itemsLoading,
    required List<Character> heroes,
  }) = _HeroesStateDataClass;
}
