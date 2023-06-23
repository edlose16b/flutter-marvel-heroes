import 'package:marvelheroes/features/home/logic/paginator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginatorWidget extends StatelessWidget {
  const PaginatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final page = context.select((PaginatorCubit cubit) => cubit.state.currentPage);
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -2),
              blurRadius: 4,
            ),
          ],
        ),
        child: _PaginatorWidget(
          onPagePressed: (page) {
            context.read<PaginatorCubit>().setPage(
                  page,
                  origin: PaginatorChangeOrigin.paginator,
                );
          },
          currentPage: page,
        ),
      ),
    );
  }
}

class _PaginatorWidget extends StatelessWidget {
  const _PaginatorWidget({
    required this.currentPage,
    required this.onPagePressed,
  });
  final int currentPage;
  final void Function(int) onPagePressed;

  @override
  Widget build(BuildContext context) {
    final visiblePages = <int>[];
    final lastPage = currentPage + 2;
    if (lastPage <= 5) {
      visiblePages.addAll(List.generate(lastPage, (index) => index + 1));
    } else if (currentPage <= 3) {
      visiblePages.addAll([1, 2, 3, 4, -1, lastPage]);
    } else if (currentPage > lastPage - 3) {
      visiblePages.addAll([1, -1, lastPage - 3, lastPage - 2, lastPage - 1, lastPage]);
    } else {
      visiblePages.addAll([
        1,
        -1,
        currentPage - 1,
        currentPage,
        currentPage + 1,
        -1,
        lastPage,
      ]);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int page in visiblePages)
          page == -1
              ? const Text('...')
              : IconButton(
                  icon: Text(
                    page.toString(),
                    style: TextStyle(
                      color: page == currentPage ? Colors.blue : Colors.white,
                      fontWeight: page == currentPage ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  onPressed: () {
                    if (page != currentPage) {
                      onPagePressed(page);
                    }
                  },
                ),
      ],
    );
  }
}
