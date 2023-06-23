import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    required this.imageWidgetBuilder,
    this.width,
    this.height,
    this.fit,
  });

  final String imageUrl;
  final Widget Function(ImageProvider image) imageWidgetBuilder;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      imageBuilder: (context, imageProvider) => imageWidgetBuilder(imageProvider),
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
    );
  }
}
