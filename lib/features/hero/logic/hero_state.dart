import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marvel/marvel.dart';

part 'hero_state.freezed.dart';

enum CharacterStateStatus { initial, loading, failed, loaded }

@freezed
abstract class HeroState with _$HeroState {
  const factory HeroState({
    required Character character,
    required CharacterStateStatus status,
    List<Comic>? comics,
    List<Event>? events,
    List<Serie>? series,
    List<Story>? stories,
  }) = _CharacterStateDataClass;
}
