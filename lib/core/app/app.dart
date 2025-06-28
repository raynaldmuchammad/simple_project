import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_project/constant/app_constant.dart';
import 'package:simple_project/constant/routes.dart';
import 'package:simple_project/core/app/route_generator.dart';
import 'package:simple_project/core/app/theme.dart';
import 'package:simple_project/core/env/env.dart';
import 'package:simple_project/modules/book/bloc/book_cubit.dart';
import 'package:simple_project/modules/book/ui/book_page.dart';
import 'package:simple_project/modules/detail_book/bloc/detail_book_cubit.dart';
import 'package:simple_project/modules/detail_book/ui/detail_book_page.dart';
import 'package:simple_project/modules/favorite/bloc/favorite_cubit.dart';
import 'package:simple_project/modules/favorite/ui/favorite_page.dart';
import 'package:simple_project/modules/main/bloc/main_cubit.dart';
import 'package:simple_project/modules/main/ui/main_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(
          create: (context) => MainCubit()..initCubit(),
          child: MainPage(),
        ),
        BlocProvider<DetailBookCubit>(
          create: (context) => DetailBookCubit(data: {})..initCubit(),
          child: DetailBookPage(),
        ),
        BlocProvider<BookCubit>(
          create: (context) => BookCubit()..initCubit(),
          child: BookPage(),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit()..initCubit(),
          child: FavoritePage(),
        ),
      ],
      child: MaterialApp(
        theme: basicTheme,
        builder: FToastBuilder(),
        navigatorKey: AppConstant.navigatorKey,
        debugShowCheckedModeBanner: Env.isDevelopment,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: Routes.landing,
      ),
    );
  }
}
