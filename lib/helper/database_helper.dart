import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_project/component/data/models/book.dart';
import 'package:simple_project/constant/db_constant.dart';

class DatabaseHelper {
  //
  void initDatabase(params) async {
    final collection = await BoxCollection.open(
      DbConstant.databaseName,
      {DbConstant.collectionBook, DbConstant.collectionFavorite},
      path: './',
    );

    await collection.openBox<Map>(DbConstant.collectionFavorite);
  }

  void storeDataBook(params) async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    final boxPath = '${appDocumentDirectory.path}/library_bad_keys.hive';

    final collection = await BoxCollection.open(
      DbConstant.databaseName,
      {params["collectionName"]},
      path: boxPath,
    );

    final boxCollection = await collection.openBox<Map>(
      params['collectionName'],
    );

    Book book = params["book"];
    await boxCollection.put(params['book'].id.toString(), book.toJson());
  }

  dynamic removeDataBook(params) async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    final boxPath = '${appDocumentDirectory.path}/library_bad_keys.hive';

    final collection = await BoxCollection.open(
      DbConstant.databaseName,
      {params["collectionName"]},
      path: boxPath,
    );

    final boxCollection = await collection.openBox<Map>(
      params['collectionName'],
    );

    var data = await boxCollection.delete(params['book'].id.toString());
    return data;
  }

  dynamic fetchDataBook(params) async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    final boxPath = '${appDocumentDirectory.path}/library_bad_keys.hive';

    final collection = await BoxCollection.open(
      DbConstant.databaseName,
      {params["collectionName"]},
      path: boxPath,
    );

    final boxCollection = await collection.openBox<Map>(
      params['collectionName'],
    );

    var data = await boxCollection.get(params['book'].id.toString());
    return data;
  }
}
