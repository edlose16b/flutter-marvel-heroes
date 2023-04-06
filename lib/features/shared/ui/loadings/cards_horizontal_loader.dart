import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardsHorizontalLoader extends StatelessWidget {
  const CardsHorizontalLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade100,
            child: Container(
              margin: const EdgeInsets.all(10),
              width: 150,
              height: 200,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
