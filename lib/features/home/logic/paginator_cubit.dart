import 'package:bloc/bloc.dart';

class PaginatorCubit extends Cubit<PaginatorState> {
  PaginatorCubit() : super(PaginatorState(currentPage: 1, origin: null));

  void setPage(int page, {PaginatorChangeOrigin? origin}) {
    if (state.currentPage == page) return;
    emit(state.copyWith(currentPage: page, origin: origin));
  }

  void addPage() {
    emit(
      state.copyWith(
        currentPage: state.currentPage + 1,
        origin: PaginatorChangeOrigin.scroll,
      ),
    );
  }

  void subtractPage() {
    emit(
      state.copyWith(
        currentPage: state.currentPage - 1,
        origin: PaginatorChangeOrigin.scroll,
      ),
    );
  }
}

enum PaginatorChangeOrigin { paginator, scroll }

class PaginatorState {
  PaginatorState({required this.currentPage, required this.origin});

  final int currentPage;
  final PaginatorChangeOrigin? origin;

  PaginatorState copyWith({int? currentPage, PaginatorChangeOrigin? origin}) {
    return PaginatorState(
      currentPage: currentPage ?? this.currentPage,
      origin: origin ?? this.origin,
    );
  }
}
