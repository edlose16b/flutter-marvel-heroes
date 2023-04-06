import 'package:dd3/features/home/logic/paginator_cubit.dart';
import 'package:dd3/features/home/widgets/paginator_widget.dart';
import 'package:dd3/features/home/widgets/superhero_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaginatorCubit(),
      child: const HomeContent(),
    );
  }
}

@visibleForTesting
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late ScrollController _scrollController; // NEW

  @override // NEW
  void initState() {
    // NEW
    super.initState(); // NEW
    _scrollController = ScrollController();

    _scrollController.addListener(handleListener);
  }

  void handleListener() {
    if (_scrollController.position.atEdge) {
      final isBottom = _scrollController.position.pixels != 0;
      if (isBottom) {
        print('At the bottom');
      }
    }
  }

  void _toEnd() {
    // NEW
    _scrollController.animateTo(
      // NEW
      _scrollController.position.maxScrollExtent, // NEW
      duration: const Duration(milliseconds: 500), // NEW
      curve: Curves.ease, // NEW
    ); // NEW
  } // NEW

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DD3 Prueba')),
      body: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: GridView.builder(
          controller: _scrollController,
          itemCount: 20,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 16,
          ),
          itemBuilder: (context, index) {
            return const SuperHeroCardItem();
          },
        ),
      ),
      bottomSheet: const PaginatorWidget(),
    );
  }
}
