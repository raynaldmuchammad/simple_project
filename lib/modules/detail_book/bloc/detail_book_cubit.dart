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
  Book book = Book();
  Book detailBook = Book();
  bool isFavorite = false;

  @override
  FutureOr<void> initCubit() async {
    emit(DetailBookLoading());

    if (data != null) {
      book = data["detail"];
      loadCubit();
    }
  }

  @override
  FutureOr<void> loadCubit() async {
    emit(DetailBookLoading());
    var params = {
      "book": book,
      "collectionName": DbConstant.collectionFavorite,
    };
    var response = await repository.fetchData(params);
    if (response["data"] != null) {
      var converted = Map<String, dynamic>.from(response["data"]);
      detailBook = Book.fromJson(converted);
      if (book.id == detailBook.id) {
        isFavorite = true;
      } else {
        isFavorite = false;
      }
    }
    emit(DetailBookLoaded());
  }

  @override
  FutureOr<void> postCubit() async {
    // Store data to local storage
    var params = {
      "book": book,
      "collectionName": DbConstant.collectionFavorite,
    };

    var response = await repository.storeData(params);
    if (response['data'] == null) {
      isFavorite = true;
      emit(DetailBookAddedFavorite(isFavorite: isFavorite));
    } else {
      isFavorite = false;
      emit(DetailBookAddedFavorite(isFavorite: isFavorite));
    }
    emit(DetailBookLoaded());
  }

  FutureOr<void> validateBook(Book current, Book selected) {
    //
  }
}
