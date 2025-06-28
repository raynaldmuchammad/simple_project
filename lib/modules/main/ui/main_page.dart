import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_project/core/app/palette.dart';
import 'package:simple_project/modules/book/ui/book_page.dart';
import 'package:simple_project/modules/book/bloc/book_cubit.dart';
import 'package:simple_project/modules/favorite/bloc/favorite_cubit.dart';
import 'package:simple_project/modules/favorite/ui/favorite_page.dart';
import 'package:simple_project/modules/main/bloc/main_cubit.dart';
import 'package:simple_project/modules/main/bloc/main_state.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MainCubit>();

    return PopScope(
      child: Scaffold(
        backgroundColor: Palette.grey300,
        bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              selectedItemColor: Palette.red,
              onTap: (index) {
                cubit.changePage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Likes",
                ),
              ],
            );
          },
        ),
        body: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomePageLoaded) {
              return BlocProvider<BookCubit>(
                create: (context) => BookCubit()..initCubit(),
                child: BookPage(),
              );
            }

            if (state is FavoritePageLoaded) {
              return BlocProvider<FavoriteCubit>(
                create: (context) => FavoriteCubit()..initCubit(),
                child: FavoritePage(),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
