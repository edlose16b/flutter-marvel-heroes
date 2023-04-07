import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marvel/marvel.dart';

part 'character_state.freezed.dart';

enum CharacterStateStatus { initial, loading, failed, loaded }

@freezed
abstract class CharacterState with _$CharacterState {
  const factory CharacterState({
    required Character character,
    required CharacterStateStatus status,
    List<Comic>? comics,
    List<Event>? events,
    List<Serie>? series,
    List<Story>? stories,
  }) = _CharacterStateDataClass;

  // factory CharacterState.initial() = CharacterStateInitial;
  // factory CharacterState.loading() = CharacterStateLoading;
  // factory CharacterState.failed() = CharacterStateFailed;
  // factory CharacterState.loaded({required List<Comic> comics}) =
  //     CharacterStateLoaded;
}
