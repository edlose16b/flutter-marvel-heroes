import 'package:marvelheroes/features/hero/pages/hero_view.dart';
import 'package:marvelheroes/features/shared/ui/widgets/cached_network_image.dart';
import 'package:marvelheroes/features/shared/ui/widgets/image_title.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:marvel/marvel.dart';

class SuperHeroCardItem extends StatelessWidget {
  const SuperHeroCardItem({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, HeroView.route(character: character));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            NetworkImageWidget(
              imageUrl: character.thumbnail ?? noImageMarvel,
              imageWidgetBuilder: (image) {
                return Hero(
                  tag: 'hero-${character.id}-image',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Text(
                character.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ).animate().fadeIn(duration: const Duration(seconds: 1)).scale(),
    );
  }
}
