import 'package:simple_project/component/data/base_repository.dart';
import 'package:simple_project/constant/url_endpoint.dart';

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
}
