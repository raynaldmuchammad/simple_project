import 'dart:developer';

import 'package:simple_project/component/data/base_repository.dart';
import 'package:simple_project/helper/database_helper.dart';

class FavoriteRepository extends BaseRepository {
  Future<Map<String, dynamic>> loadFavorite(dynamic body) async {
    try {
      List<Map<String, dynamic>> books = [];
      DatabaseHelper database = DatabaseHelper();

      var data = await database.fetchDataBooks(body);

      var converted = Map<String, dynamic>.from(data);
      converted.forEach((key, value) {
        var book = Map<String, dynamic>.from(value);
        books.add(book);
      });

      return {"success": true, "data": books};
    } on Error catch (e) {
      throw Exception("Failed to get user approval: $e");
    }
  }
}
