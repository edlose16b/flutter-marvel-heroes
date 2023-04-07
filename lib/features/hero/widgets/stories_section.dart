import 'package:dd3/app/ui/sizes.dart';
import 'package:dd3/features/hero/logic/hero_cubit.dart';
import 'package:dd3/features/shared/ui/loadings/cards_horizontal_loader.dart';
import 'package:dd3/features/shared/ui/widgets/image_title.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/marvel.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = context.select((HeroCubit cubit) => cubit.state.stories);

    if (stories != null && stories.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Stories',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: Sizes.mid),
        if (stories == null) _buildLoading() else _buildList(stories),
      ],
    );
  }

  Widget _buildLoading() {
    return const CardsHorizontalLoader();
  }

  Widget _buildList(List<Story> stories) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: stories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final story = stories[index];
          return ImageTitle(
            thumbnail: story.thumbnail,
            title: story.title,
            extra: Text(story.description),
          );
        },
      ),
    );
  }
}
