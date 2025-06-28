import 'dart:developer';

import 'package:simple_project/component/data/base_repository.dart';
import 'package:simple_project/component/data/models/book.dart';
import 'package:simple_project/constant/url_endpoint.dart';
import 'package:simple_project/helper/database_helper.dart';

class DetailBookRepository extends BaseRepository {
  Future<Map<String, dynamic>> loadDetail(dynamic body) async {
    try {
      var params = UrlEndpoint.bookUrl;
      if (body['keywords'] != null) {
        params = params + "?search=${body['keywords']}";
      }

      var response = await provider.get("$baseUrl/$params");
      return response;
    } on Error catch (e) {
      throw Exception("Failed to get user approval: $e");
    }
  }

  Future<Map<String, dynamic>> storeData(dynamic body) async {
    try {
      DatabaseHelper database = DatabaseHelper();

      var data = await database.fetchDataBook(body);

      if (data == null) {
        database.storeDataBook(body);
      } else if (data != null) {
        database.removeDataBook(body);
      }

      return {"success": true, "data": data};
    } on Error catch (e) {
      throw Exception("Failed to get user approval: $e");
    }
  }
}
