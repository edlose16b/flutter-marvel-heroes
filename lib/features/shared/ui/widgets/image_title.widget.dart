import 'package:dd3/features/hero/widgets/detail_modal.dart';
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
    required this.thumbnail,
    required this.title,
    this.extra,
  });

  final String? thumbnail;
  final String title;
  final Widget? extra;

  @override
  Widget build(BuildContext context) {
    final secureThumbnail = thumbnail ?? noImageMarvel;

    return InkWell(
      onTap: () {
        DetailModal.showModal(context, secureThumbnail, title, extra);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 180,
        child: NetworkImageWidget(
          imageUrl: secureThumbnail,
          imageWidgetBuilder: (image) {
            return Image(
              image: image,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
