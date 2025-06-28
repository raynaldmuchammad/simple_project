import 'dart:async';
import 'dart:developer';

import 'package:simple_project/component/bloc/base_cubit.dart';
import 'package:simple_project/component/data/models/book.dart';
import 'package:simple_project/constant/db_constant.dart';
import 'package:simple_project/modules/detail_book/bloc/detail_book_state.dart';
import 'package:simple_project/modules/detail_book/repository/detail_book_repository.dart';

class DetailBookCubit extends BaseCubit<DetailBookState> {
  DetailBookCubit({required this.data}) : super(DetailBookLoading());

  DetailBookRepository repository = DetailBookRepository();

  late Map<String, dynamic> formats;
  late dynamic data;
  late bool isFavorite = false;
  Book book = Book();

  @override
  FutureOr<void> initCubit() async {
    emit(DetailBookLoading());

    if (data != null) {
      book = data["detail"];
      postCubit();
    }

    emit(DetailBookLoaded());
  }

  @override
  FutureOr<void> loadCubit() {
    // load data
  }

  @override
  FutureOr<void> postCubit() async {
    // Store data to local storage
    var params = {
      "book": book,
      "collectionName": DbConstant.collectionFavorite,
    };
    var response = await repository.storeData(params);
    if (response['data'] != null) {
      var converted = Map<String, dynamic>.from(response["data"]);
      Book data = Book.fromJson(converted);
      validateBook(book, data);
    } else {
      isFavorite = false;
      emit(DetailBookAddedFavorite(isFavorite: isFavorite));
    }
  }

  FutureOr<void> validateBook(Book current, Book selected) {
    if (current.id == selected.id) {
      isFavorite = true;
      emit(DetailBookAddedFavorite(isFavorite: isFavorite));
    }
  }
}
