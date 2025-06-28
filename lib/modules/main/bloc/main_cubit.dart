import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simple_project/component/bloc/base_cubit.dart';
import 'package:simple_project/component/data/models/book.dart';
import 'package:simple_project/helper/general_helpepr.dart';
import 'package:simple_project/modules/main/bloc/main_state.dart';
import 'package:simple_project/modules/main/repository/main_repository.dart';

class MainCubit extends BaseCubit<MainState> {
  MainCubit() : super(MainLoading(progressCount: 0.1));

  FlutterSecureStorage secureStorage = FlutterSecureStorage();
  MainRepository repository = MainRepository();
  GeneralHelper helper = GeneralHelper();

  late List<Book> books = [];
  String nextUrl = "";
  int total = 0;

  TextEditingController controller = TextEditingController();
  late int currentIndex = 0;

  @override
  FutureOr<void> initCubit() async {
    if (currentIndex == 0) {
      emit(HomePageLoaded());
    } else if (currentIndex == 1) {
      emit(FavoritePageLoaded());
    }
  }

  FutureOr<void> changePage(int index) {
    currentIndex = index;
    if (currentIndex == 1) {
      emit(FavoritePageLoaded());
    }

    if (currentIndex == 0) {
      emit(HomePageLoaded());
    }
  }

  @override
  FutureOr<void> loadCubit() {}

  @override
  FutureOr<void> postCubit() {}
}
