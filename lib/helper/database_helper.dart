import 'package:hive/hive.dart';
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

  void storeData(params) async {
    final collection = await BoxCollection.open(
      DbConstant.databaseName,
      {params["collectionName"]},
      path: './',
    );

    final boxCollection = await collection.openBox<Map>(
      params['collectionName'],
    );

    await boxCollection.put(params['book'].id, params['book']);
  }
}
