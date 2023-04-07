import 'package:dd3/app/ui/sizes.dart';
import 'package:dd3/features/hero/logic/hero_cubit.dart';
import 'package:dd3/features/hero/widgets/detail_modal.dart';
import 'package:dd3/features/shared/ui/loadings/cards_horizontal_loader.dart';
import 'package:dd3/features/shared/ui/widgets/image_title.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/marvel.dart';

class ComicsSection extends StatelessWidget {
  const ComicsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final comics = context.select((HeroCubit cubit) => cubit.state.comics);

    if (comics != null && comics.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comics',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: Sizes.mid),
        if (comics == null) _buildLoading() else _buildList(comics),
      ],
    );
  }

  Widget _buildLoading() {
    return const CardsHorizontalLoader();
  }

  Widget _buildList(List<Comic> comics) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: comics.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final comic = comics[index];

          return ImageTitle(
            thumbnail: comic.thumbnail,
            title: comic.title,
            extra: Column(
              children: [
                if (comic.description != null) Text(comic.description!),
              ],
            ),
          );
        },
      ),
    );
  }
}
