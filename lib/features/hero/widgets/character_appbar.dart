import 'package:dd3/features/shared/ui/widgets/cached_network_image.dart';
import 'package:dd3/features/shared/ui/widgets/image_title.widget.dart';
import 'package:flutter/material.dart';
import 'package:marvel/marvel.dart';

class CharacterAppBar extends StatelessWidget {
  const CharacterAppBar({
    super.key,
    required this.character,
  });
  final Character character;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      floating: true,
      pinned: true,
      snap: true,
      actionsIconTheme: const IconThemeData(opacity: 0),
      flexibleSpace: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Hero(
              tag: 'image-${character.id}',
              child: NetworkImageWidget(
                imageUrl: character.thumbnail ?? noImageMarvel,
                imageWidgetBuilder: (image) {
                  return Image(
                    image: image,
                    fit: BoxFit.fitWidth,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
