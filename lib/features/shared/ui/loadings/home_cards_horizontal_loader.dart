import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeCardsHorizontalLoader extends StatelessWidget {
  const HomeCardsHorizontalLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        child: PageView.builder(
          itemCount: 3,
          controller: PageController(viewportFraction: 0.8),
          onPageChanged: (int index) {},
          itemBuilder: (_, i) {
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
      ),
    );
  }
}
