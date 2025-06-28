import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_project/component/bloc/base_cubit.dart';
import 'package:simple_project/component/data/models/book.dart';
import 'package:simple_project/constant/db_constant.dart';
import 'package:simple_project/modules/favorite/bloc/favorite_state.dart';
import 'package:simple_project/modules/favorite/repository/favorite_repository.dart';

class FavoriteCubit extends BaseCubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteLoading());

  FavoriteRepository repository = FavoriteRepository();

  late List<Book> books = [];
  String nextUrl = "";
  int total = 0;
  TextEditingController controller = TextEditingController();

  @override
  FutureOr<void> initCubit() async {
    emit(FavoriteLoading());
    var params = {
      "collectionName": DbConstant.collectionFavorite,
    };

    var response = await repository.loadFavorite(params);
    if (response["data"] != null) {
      books = (response["data"] as List)
          .map((book) => Book.fromJson(book))
          .toList();
    }

    emit(FavoriteLoaded());
  }

  @override
  FutureOr<void> loadCubit() {
    //
  }

  @override
  FutureOr<void> postCubit() {
    //
  }

  Future<void> refresh() async {
    await initCubit();
  }
}
