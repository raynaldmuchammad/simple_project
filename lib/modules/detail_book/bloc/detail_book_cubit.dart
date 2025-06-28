import 'dart:async';

import 'package:simple_project/component/bloc/base_cubit.dart';
import 'package:simple_project/component/data/models/book.dart';
import 'package:simple_project/modules/detail_book/bloc/detail_book_state.dart';
import 'package:simple_project/modules/detail_book/repository/detail_book_repository.dart';

class DetailBookCubit extends BaseCubit<DetailBookState> {
  DetailBookCubit({required this.data}) : super(DetailBookLoading());

  DetailBookRepository repository = DetailBookRepository();
  
  late Map<String, dynamic> formats;
  late dynamic data;
  Book book = Book();
  

  @override
  FutureOr<void> initCubit() {
    emit(DetailBookLoading());

    if (data != null) {
      book = data["detail"];
    }

    emit(DetailBookLoaded());
  }

  @override
  FutureOr<void> loadCubit() {
    // TODO: implement loadCubit
  }

  @override
  FutureOr<void> postCubit() {
    // TODO: implement postCubit
  }
}
