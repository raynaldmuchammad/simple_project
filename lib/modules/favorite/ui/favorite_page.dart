import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_project/component/data/models/book.dart';
import 'package:simple_project/constant/routes.dart';
import 'package:simple_project/constant/utils.dart';
import 'package:simple_project/core/app/palette.dart';
import 'package:simple_project/modules/favorite/bloc/favorite_cubit.dart';
import 'package:simple_project/modules/favorite/bloc/favorite_state.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FavoriteCubit>();
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                // Search
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: Util.basePaddingMargin14,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: Util.basePaddingMargin16,
                    horizontal: Util.basePaddingMargin16,
                  ),
                  height: Util.baseWidthHeight80,
                  decoration: BoxDecoration(color: Palette.white),
                  child: TextFormField(
                    controller: cubit.controller,
                    onEditingComplete: () {
                      cubit.initCubit();
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    onFieldSubmitted: (text) {
                      cubit.initCubit();
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    onTapOutside: (value) {
                      cubit.initCubit();
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "Search",
                      border: InputBorder.none,
                      suffix: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(
                          Icons.search,
                          color: Palette.red,
                          size: Util.baseTextSize18,
                        ),
                        onPressed: () {
                          //
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: Util.basePaddingMargin16,
                        horizontal: Util.basePaddingMargin10,
                      ),
                      filled: true,
                      fillColor: Palette.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Palette.red,
                          width: Util.baseWidthHeight2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(Util.baseRoundedCorner),
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Palette.grey400,
                        fontSize: Util.baseTextSize16,
                        fontWeight: FontWeight.normal,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Palette.grey400!,
                          width: Util.baseWidthHeight1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(Util.baseRoundedCorner),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Palette.grey400!,
                          width: Util.baseWidthHeight1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(Util.baseRoundedCorner),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Palette.red,
                          width: Util.baseWidthHeight1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(Util.baseRoundedCorner),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Palette.red,
                          width: Util.baseWidthHeight2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(Util.baseRoundedCorner),
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Palette.grey400,
                        fontWeight: FontWeight.normal,
                        fontSize: Util.baseTextSize14,
                      ),
                    ),
                  ),
                ),
                // List Book
                Expanded(
                  flex: 10,
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cubit.books.length,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          vertical: Util.basePadding,
                          horizontal: Util.basePadding,
                        ),
                        itemBuilder: (context, index) {
                          Book data = cubit.books[index];
                          List<String?> names =
                              data.authors!.map((e) => e.name).toList();
                          return GestureDetector(
                            onTap: () {
                              // Navigate to detail
                              Navigator.of(context).pushNamed(
                                Routes.detail,
                                arguments: {"detail": data},
                              );
                            },
                            child: Container(
                              height: Util.baseWidthHeight110,
                              padding: EdgeInsets.symmetric(
                                vertical: Util.basePaddingMargin10,
                                horizontal: Util.basePaddingMargin10,
                              ),
                              margin: EdgeInsets.symmetric(
                                vertical: Util.basePaddingMargin6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Palette.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.title!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: Util.baseTextSize18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: Util.baseWidthHeight4,
                                          ),
                                          Text(
                                            names.join(','),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: Util.baseTextSize14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.arrow_forward_ios),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  //
}
