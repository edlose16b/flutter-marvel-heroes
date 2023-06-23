import 'package:marvelheroes/core/constants.dart';
import 'package:marvelheroes/features/home/logic/heroes_cubit.dart';
import 'package:marvelheroes/features/home/logic/heroes_state.dart';
import 'package:marvelheroes/features/home/logic/paginator_cubit.dart';
import 'package:marvelheroes/features/home/widgets/paginator_widget.dart';
import 'package:marvelheroes/features/home/widgets/superhero_card_item.dart';
import 'package:marvelheroes/features/shared/ui/loadings/hero_card_loader.dart';
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
          create: (_) =>
              HeroesCubit(charactersRepository: context.read())..loadMore(),
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

const sizePerRow = 370;
const itemsPerRow = 2;

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
  Widget build(BuildContext context) {
    return BlocBuilder<HeroesCubit, HeroesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Marvel Heroes')),
          body: Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: BlocListener<PaginatorCubit, PaginatorState>(
              listener: (context, state) {
                if (state.origin == PaginatorChangeOrigin.paginator) {
                  handleScrollToPosition(state.currentPage);
                }
              },
              child: _buildGridView(state),
            ),
          ),
          bottomSheet: const PaginatorWidget(),
        );
      },
    );
  }
  // WIDGETS

  Widget _buildGridView(HeroesState state) {
    return GridView.builder(
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
          return const HeroCardLoader();
        }

        return SuperHeroCardItem(character: state.heroes[index]);
      },
    );
  }
  // METHODS

  void handleListener() {
    if (isAboutToBottom) {
      context.read<HeroesCubit>().loadMore();
    }

    context
        .read<PaginatorCubit>()
        .setPage(currentPageOnScroll, origin: PaginatorChangeOrigin.scroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(handleListener);
    super.dispose();
  }

  void handleScrollToPosition(int currentPage) {
    _toPosition(sizePerRow * (currentPage - 1) * 10.0);
  }

  void _toPosition(double index) {
    _scrollController.animateTo(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  /// when scroll is about to touch the bottom of the scroll
  bool get isAboutToBottom =>
      _scrollController.offset >=
      _scrollController.position.maxScrollExtent - sizePerRow;

  int get currentPageOnScroll =>
      (_scrollController.offset ~/
          (sizePerRow * Constants.heroesPerPage / itemsPerRow)) +
      1;
}
