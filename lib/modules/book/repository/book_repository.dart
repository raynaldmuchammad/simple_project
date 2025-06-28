import 'dart:developer';

import 'package:simple_project/component/data/base_repository.dart';
import 'package:simple_project/constant/url_endpoint.dart';

class BookRepository extends BaseRepository {
  Future<Map<String, dynamic>> loadbook(dynamic body) async {
    try {
      var params = baseUrl + "/" + UrlEndpoint.bookUrl;
      if (body['keywords'] != null) {
        params = params + "?search=${body['keywords']}";
      }

      if (body['nextUrl'] != null) {
        params = body['nextUrl'];
      }

      var response = await provider.get(params);
      return response;
    } on Error catch (e) {
      throw Exception("Failed to get user approval: $e");
    }
  }
}
