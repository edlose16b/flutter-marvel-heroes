import 'package:dd3/features/shared/ui/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';

const noImageMarvel =
    'https://i.pinimg.com/originals/64/25/d3/6425d375a54d8bd3331a3ed6a3b25fe7.jpg';

/// {@tempalte image_title}
/// It renders a Image and a title
/// {@endtemplate}
class ImageTitle extends StatelessWidget {
  /// {@macro image_title}
  const ImageTitle({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  final String? imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 150,
        maxWidth: 150,
        minHeight: 200,
        maxHeight: 230,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            child: NetworkImageWidget(
              imageUrl: imageUrl != null ? imageUrl! : noImageMarvel,
              imageWidgetBuilder: (image) {
                return Image(
                  image: image,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}
