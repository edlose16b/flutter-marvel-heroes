import 'package:bloc_test/bloc_test.dart';
import 'package:dd3/features/home/logic/paginator_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<PaginatorCubit, PaginatorState>(
    'initial state should have [currentPage] 1',
    build: PaginatorCubit.new,
    verify: (bloc) {
      expect(bloc.state.currentPage, equals(1));
    },
  );

  blocTest<PaginatorCubit, PaginatorState>(
    'should change state when it calls [addPage], [subtractPage] amd [setPage]',
    build: PaginatorCubit.new,
    act: (cubit) {
      cubit
        ..addPage()
        ..addPage()
        ..subtractPage()
        ..addPage()
        ..subtractPage()
        ..setPage(10, origin: PaginatorChangeOrigin.paginator)
        ..subtractPage();
    },
    expect: () {
      PaginatorState state(int page) => PaginatorState(
            currentPage: page,
            origin: PaginatorChangeOrigin.scroll,
          );

      return [
        equals(state(2)),
        equals(state(3)),
        equals(state(2)),
        equals(state(3)),
        equals(state(2)),
        equals(
          const PaginatorState(
            currentPage: 10,
            origin: PaginatorChangeOrigin.paginator,
          ),
        ),
        equals(state(9)),
      ];
    },
  );
}
