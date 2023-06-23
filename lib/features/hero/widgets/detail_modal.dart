import 'package:marvelheroes/app/ui/sizes.dart';
import 'package:marvelheroes/features/shared/ui/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailModal extends StatelessWidget {
  const DetailModal({
    super.key,
    required this.thumbnail,
    required this.title,
    this.extra,
  });
  final String thumbnail;
  final String title;
  final Widget? extra;

  static Future<void> showModal(
    BuildContext context,
    String thumbnail,
    String title,
    Widget? extra,
  ) async {
    return showDialog(
      context: context,
      builder: (context) {
        return DetailModal(
          thumbnail: thumbnail,
          title: title,
          extra: extra,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(Sizes.large),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: Sizes.mid),
              NetworkImageWidget(
                imageUrl: thumbnail,
                width: 250,
                imageWidgetBuilder: (image) {
                  return Image(
                    image: image,
                    fit: BoxFit.cover,
                  );
                },
              ),
              const SizedBox(height: Sizes.mid),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: Sizes.mid),
              if (extra != null) extra! else const SizedBox.shrink(),
              const SizedBox(height: Sizes.mid),
            ],
          ),
        ),
      ),
    );
  }
}
