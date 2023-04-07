import 'package:dd3/app/ui/sizes.dart';
import 'package:dd3/features/hero/logic/character_cubit.dart';
import 'package:dd3/features/shared/ui/loadings/cards_horizontal_loader.dart';
import 'package:dd3/features/shared/ui/widgets/image_title.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:marvel/marvel.dart';

class EventsSection extends StatelessWidget {
  const EventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final events = context.select((CharacterCubit cubit) => cubit.state.events);
    if (events != null && events.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Events',
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
      height: 280,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: events.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final event = events[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child:
                    ImageTitle(imageUrl: event.thumbnail, title: event.title),
              ),
              Text(DateFormat('yyyy-MM').format(event.start)),
            ],
          );
        },
      ),
    );
  }
}
