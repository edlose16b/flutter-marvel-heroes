import 'package:marvelheroes/app/ui/sizes.dart';
import 'package:marvelheroes/features/hero/logic/hero_cubit.dart';
import 'package:marvelheroes/features/shared/ui/loadings/cards_horizontal_loader.dart';
import 'package:marvelheroes/features/shared/ui/widgets/image_title.widget.dart';
import 'package:marvelheroes/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:marvel/marvel.dart';

class EventsSection extends StatelessWidget {
  const EventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final events = context.select((HeroCubit cubit) => cubit.state.events);
    if (events != null && events.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.events,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: Sizes.mid),
        if (events == null) _buildLoading() else _buildList(events),
      ],
    );
  }

  Widget _buildLoading() {
    return const CardsHorizontalLoader();
  }

  Widget _buildList(List<Event> events) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: events.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final event = events[index];
          return ImageTitle(
            thumbnail: event.thumbnail,
            title: event.title,
            extra: Column(
              children: [
                Text(event.description),
                if (event.start != null && event.end != null)
                  Text('${DateFormat('yyyy-MM').format(event.start!)}-'
                      '${DateFormat('yyyy-MM').format(event.end!)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
