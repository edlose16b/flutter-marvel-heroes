import 'package:bloc/bloc.dart';

class PaginatorCubit extends Cubit<int> {
  PaginatorCubit() : super(1);

  void setPage(int page) {
    emit(page);
  }

  void addPage() {
    if (state == 20) return;
    emit(state + 1);
  }

  void subtractPage() {
    if (state == 1) return;
    emit(state - 1);
  }
}
