import 'package:dd3/app/ui/sizes.dart';
import 'package:dd3/features/hero/logic/character_cubit.dart';
import 'package:dd3/features/hero/widgets/comics_section.dart';
import 'package:dd3/features/hero/widgets/events_section.dart';
import 'package:dd3/features/hero/widgets/series_section.dart';
import 'package:dd3/features/hero/widgets/stories_section.dart';
import 'package:dd3/features/shared/ui/widgets/image_title.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/marvel.dart';

class HeroView extends StatelessWidget {
  const HeroView({
    super.key,
    required this.character,
  });

  final Character character;

  static Route<dynamic> route({required Character character}) =>
      MaterialPageRoute(
        builder: (_) => HeroView(character: character),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterCubit(
        character: character,
        charactersRepository: context.read(),
      )..fetchData(),
      child: HeroContent(character: character),
    );
  }
}

class HeroContent extends StatefulWidget {
  const HeroContent({super.key, required this.character});
  final Character character;
  @override
  State<HeroContent> createState() => _HeroContentState();
}

class _HeroContentState extends State<HeroContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            widget.character.thumbnail ?? noImageMarvel,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.9),
                ],
                stops: const [0.0, 0.7, 1.0],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * .5),
                  Text(
                    widget.character.name,
                    style: const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.character.description,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: Sizes.mid),
                  const ComicsSection(),
                  const SizedBox(height: Sizes.mid),
                  const EventsSection(),
                  const SizedBox(height: Sizes.mid),
                  const SeriesSection(),
                  const SizedBox(height: Sizes.mid),
                  const StoriesSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
