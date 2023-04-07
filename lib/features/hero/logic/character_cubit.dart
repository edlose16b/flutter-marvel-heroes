// ignore_for_file: unused_result

import 'dart:async';

import 'package:dd3/features/hero/logic/character_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/marvel.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit({
    required this.charactersRepository,
    required this.character,
  }) : super(
          CharacterState(
            character: character,
            status: CharacterStateStatus.initial,
          ),
        );

  final CharactersRepository charactersRepository;
  final Character character;

  Future<void> fetchData() async {
    unawaited(_fetchComics());
    unawaited(_fetchEvents());
    unawaited(_fetchSeries());
    unawaited(_fetchStories());
  }

  Future<void> _fetchComics() async {
    if (state.comics != null) return;

    final response = await charactersRepository.fetchComics(character.id);
    response.fold((_) {}, (r) {
      emit(state.copyWith(comics: r));
    });
  }

  Future<void> _fetchEvents() async {
    if (state.events != null) return;

    final response = await charactersRepository.fetchEvents(character.id);
    response.fold((_) {}, (r) {
      emit(state.copyWith(events: r));
    });
  }

  Future<void> _fetchSeries() async {
    if (state.series != null) return;

    final response = await charactersRepository.fetchSeries(character.id);
    response.fold((_) {}, (r) {
      emit(state.copyWith(series: r));
    });
  }

  Future<void> _fetchStories() async {
    if (state.stories != null) return;

    final response = await charactersRepository.fetchStories(character.id);
    response.fold((_) {}, (r) {
      emit(state.copyWith(stories: r));
    });
  }
}
