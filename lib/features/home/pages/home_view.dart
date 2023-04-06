import 'dart:async';
import 'dart:developer';

import 'package:dd3/core/constants.dart';
import 'package:dd3/features/home/logic/heroes_cubit.dart';
import 'package:dd3/features/home/logic/heroes_state.dart';
import 'package:dd3/features/home/logic/paginator_cubit.dart';
import 'package:dd3/features/home/widgets/paginator_widget.dart';
import 'package:dd3/features/home/widgets/superhero_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PaginatorCubit(),
        ),
        BlocProvider(
          create: (_) => HeroesCubit()..loadMore(),
        ),
      ],
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

const perRowSize = 370;

class _HomeContentState extends State<HomeContent> {
  late ScrollController _scrollController;
  late PaginatorCubit paginatorCubit;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    paginatorCubit = context.read<PaginatorCubit>();
    _scrollController.addListener(handleListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(handleListener);
    super.dispose();
  }

  void handleListener() {
    if (isAboutToBottom) {
      context.read<HeroesCubit>().loadMore();
    }

    final currentPage =
        _scrollController.offset ~/ (perRowSize * Constants.heroesPerPage / 2);
    context.read<PaginatorCubit>().setPage(currentPage + 1);
  }

  // void _toPosition(double index) {
  //   _scrollController.animateTo(
  //     index,
  //     // _scrollController.position.maxScrollExtent,
  //     duration: const Duration(milliseconds: 500),
  //     curve: Curves.ease,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HeroesCubit, HeroesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('DD3 Prueba')),
          body: Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: BlocListener<PaginatorCubit, int>(
              listener: (context, state) {
                // _toPosition(perRowSize * (state - 1) * 10.0);
              },
              child: GridView.builder(
                controller: _scrollController,
                itemCount: state.heroes.length + state.itemsLoading,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 350,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  if (state.status == HeroesStatus.loading &&
                      index >= state.heroes.length) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return SuperHeroCardItem(
                    index: index,
                  );
                },
              ),
            ),
          ),
          bottomSheet: const PaginatorWidget(),
        );
      },
    );
  }

  bool get isAboutToBottom =>
      _scrollController.offset >=
      _scrollController.position.maxScrollExtent - perRowSize;
}
