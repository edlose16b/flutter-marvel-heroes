import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HeroCardLoader extends StatelessWidget {
  const HeroCardLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
      highlightColor: Colors.grey.shade100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Container(
          margin: const EdgeInsets.all(10),
          color: Colors.black,
        ),
      ),
    );
  }
}
