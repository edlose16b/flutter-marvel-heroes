import 'package:bloc/bloc.dart';

class PaginatorCubit extends Cubit<int> {
  PaginatorCubit() : super(0);

  void setPage(int page) {
    emit(page);
  }
}
