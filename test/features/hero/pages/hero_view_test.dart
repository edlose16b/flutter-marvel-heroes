import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:marvelheroes/features/hero/logic/hero_cubit.dart';
import 'package:marvelheroes/features/hero/logic/hero_state.dart';
import 'package:marvelheroes/features/hero/pages/hero_view.dart';
import 'package:marvelheroes/features/hero/widgets/comics_section.dart';
import 'package:marvelheroes/features/hero/widgets/events_section.dart';
import 'package:marvelheroes/features/hero/widgets/series_section.dart';
import 'package:marvelheroes/features/hero/widgets/stories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/marvel.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/helpers.dart';

class MockHeroCubit extends MockCubit<HeroState> implements HeroCubit {}

void main() {
  late HeroCubit heroCubit;

  setUp(() {
    heroCubit = MockHeroCubit();
    HttpOverrides.global = null;
  });

  Widget setUpPump(Widget widget) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => heroCubit,
        ),
      ],
      child: widget,
    );
  }

  group('Hero View', () {
    testWidgets('should render a simple view', (widgetTester) async {
      // arrange
      when(() => heroCubit.state).thenReturn(
        HeroState(
          character: characterEntity,
          status: CharacterStateStatus.initial,
        ),
      );

      // act
      await widgetTester
          .pumpApp(setUpPump(HeroContent(character: characterEntity)));

      //assert
      expect(find.text(characterEntity.name), findsOneWidget);
      expect(find.text(characterEntity.description), findsOneWidget);
    });

    testWidgets('should render hero view with data', (widgetTester) async {
      // arrange
      when(() => heroCubit.state).thenReturn(
        HeroState(
          character: characterEntity,
          status: CharacterStateStatus.initial,
          comics: [],
          events: [],
          series: [],
          stories: [],
        ),
      );

      // act
      await widgetTester
          .pumpApp(setUpPump(HeroContent(character: characterEntity)));

      //assert
      expect(find.text(characterEntity.name), findsOneWidget);
      expect(find.byType(ComicsSection), findsOneWidget);
      expect(find.byType(EventsSection), findsOneWidget);
      expect(find.byType(SeriesSection), findsOneWidget);
      expect(find.byType(StoriesSection), findsOneWidget);
    });
  });
}
