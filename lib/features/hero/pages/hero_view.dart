import 'package:flutter/material.dart';

class HeroView extends StatelessWidget {
  const HeroView({super.key});

  static Route<dynamic> route() => MaterialPageRoute(
        builder: (_) => const HeroView(),
      );

  @override
  Widget build(BuildContext context) {
    return const HeroContent();
  }
}

class HeroContent extends StatefulWidget {
  const HeroContent({super.key});

  @override
  State<HeroContent> createState() => _HeroContentState();
}

class _HeroContentState extends State<HeroContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.9),
                ],
                stops: const [0.0, 0.7, 1.0],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * .5),
                  const Text(
                    'Título de la imagen',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Descripción de la imagen',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Más',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
