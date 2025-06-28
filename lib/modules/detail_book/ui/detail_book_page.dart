import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_project/component/data/models/format.dart';
import 'package:simple_project/constant/utils.dart';
import 'package:simple_project/core/app/palette.dart';
import 'package:simple_project/modules/detail_book/bloc/detail_book_cubit.dart';
import 'package:simple_project/modules/detail_book/bloc/detail_book_state.dart';

class DetailBookPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DetailBookPageState();
}

class DetailBookPageState extends State<DetailBookPage> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    var cubit = context.watch<DetailBookCubit>();
    List<String?> names = [];
    Format formats;
    String imageUrl = "";

    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<DetailBookCubit, DetailBookState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is DetailBookLoaded) {
            formats = cubit.book.formats!;
            imageUrl = formats.image ?? "https://placehold.co/600x400";
            names = cubit.book.authors!.map((e) => e.name).toList();
          }

          if (state is DetailBookAddedFavorite) {
            cubit.isFavorite = state.isFavorite;
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      width: mediaQuery.width,
                      height: Util.baseWidthHeight250,
                      child: imageUrl.isEmpty
                          ? Container()
                          : Image.network(
                              imageUrl,
                              fit: BoxFit.fitWidth,
                            ),
                    ),

                    // Title
                    Container(
                      width: mediaQuery.width,
                      padding: EdgeInsets.symmetric(
                        vertical: Util.basePaddingMargin10,
                        horizontal: Util.basePaddingMargin18,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              cubit.book.title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: Util.baseTextSize18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: Util.baseWidthHeight72,
                              height: Util.baseWidthHeight72,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  cubit.postCubit();
                                },
                                icon: Icon(
                                  cubit.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: cubit.isFavorite
                                      ? Palette.red
                                      : Palette.black,
                                  size: Util.baseTextSize28,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Authors
                    Container(
                      width: mediaQuery.width,
                      padding: EdgeInsets.symmetric(
                        vertical: Util.basePaddingMargin10,
                        horizontal: Util.basePaddingMargin18,
                      ),
                      child: Text(
                        names.join(','),
                        style: TextStyle(
                          fontSize: Util.baseTextSize14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    // Summary
                    Container(
                      width: mediaQuery.width,
                      height: mediaQuery.height / 3,
                      padding: EdgeInsets.symmetric(
                        vertical: Util.basePaddingMargin10,
                        horizontal: Util.basePaddingMargin18,
                      ),
                      child: Text(
                        cubit.book.summaries!.join(''),
                        maxLines: 7,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Util.baseTextSize14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
