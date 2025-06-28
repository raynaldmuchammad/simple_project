import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_project/component/bloc/base_cubit.dart';
import 'package:simple_project/component/data/models/book.dart';
import 'package:simple_project/modules/favorite/bloc/favorite_state.dart';
import 'package:simple_project/modules/favorite/repository/favorite_reporitory.dart';

class FavoriteCubit extends BaseCubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteLoading());

  FavoriteRepository repository = FavoriteRepository();

  late List<Book> books = [];
  String nextUrl = "";
  int total = 0;
  TextEditingController controller = TextEditingController();

  @override
  FutureOr<void> initCubit() {
    // 
  }

  @override
  FutureOr<void> loadCubit() {
    // 
  }

  @override
  FutureOr<void> postCubit() {
    // 
  }
}
