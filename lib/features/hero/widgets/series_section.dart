import 'package:dd3/app/ui/sizes.dart';
import 'package:dd3/features/hero/logic/character_cubit.dart';
import 'package:dd3/features/shared/ui/loadings/cards_horizontal_loader.dart';
import 'package:dd3/features/shared/ui/widgets/image_title.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/marvel.dart';

class SeriesSection extends StatelessWidget {
  const SeriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final series = context.select((CharacterCubit cubit) => cubit.state.series);
    if (series != null && series.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Series',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: Sizes.mid),
        if (series == null) _buildLoading() else _buildList(series),
      ],
    );
  }

  Widget _buildLoading() {
    return const CardsHorizontalLoader();
  }

  Widget _buildList(List<Serie> series) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: series.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final serie = series[index];
          return ImageTitle(
            thumbnail: serie.thumbnail,
            title: serie.title,
            extra: Column(
              children: [
                if (serie.description != null) Text(serie.description!),
                if (serie.rating.isNotEmpty) Text(serie.rating),
              ],
            ),
          );
        },
      ),
    );
  }
}
