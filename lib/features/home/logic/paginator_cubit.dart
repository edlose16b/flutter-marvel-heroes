import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class PaginatorCubit extends Cubit<PaginatorState> {
  PaginatorCubit() : super(const PaginatorState(currentPage: 1, origin: null));

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

class PaginatorState extends Equatable {
  const PaginatorState({required this.currentPage, required this.origin});

  final int currentPage;
  final PaginatorChangeOrigin? origin;

  PaginatorState copyWith({int? currentPage, PaginatorChangeOrigin? origin}) {
    return PaginatorState(
      currentPage: currentPage ?? this.currentPage,
      origin: origin ?? this.origin,
    );
  }

  @override
  List<Object?> get props => [currentPage, origin];
}
