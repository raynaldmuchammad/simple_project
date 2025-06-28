import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:simple_project/component/bloc/base_cubit.dart';
import 'package:simple_project/component/data/models/book.dart';
import 'package:simple_project/modules/book/bloc/book_state.dart';
import 'package:simple_project/modules/book/repository/book_repository.dart';

class BookCubit extends BaseCubit<BookState> {
  BookCubit() : super(BookLoading());

  BookRepository repository = BookRepository();

  late List<Book> books = [];
  String nextUrl = "";
  int total = 0;
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  FutureOr<void> initCubit() async {
    emit(BookLoading());
    var params = {};
    if (controller.text.isNotEmpty) {
      params["keywords"] = controller.text;

      if (books.isNotEmpty) {
        books.clear();
      }
    }

    var response = await repository.loadbook(params);

    total = response["count"];
    nextUrl = response["next"];

    books = List<Book>.from(
      response["results"].map((book) => Book.fromJson(book)),
    ).toList();

    scrollController.addListener(loadCubit);

    emit(BookLoaded());
  }

  @override
  FutureOr<void> loadCubit() async {
    if (nextUrl.isNotEmpty &&
        scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
      emit(BookLoadingPagination());
      var params = {
        "nextUrl": nextUrl,
      };

      var response = await repository.loadbook(params);

      total = response["count"];
      nextUrl = response["next"];

      List<Book> newBooks = List<Book>.from(
        response["results"].map((book) => Book.fromJson(book)),
      ).toList();

      books.addAll(newBooks);

      emit(BookLoadedPagination());
    }
  }

  @override
  FutureOr<void> postCubit() {}
}
