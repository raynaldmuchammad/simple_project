import 'package:simple_project/core/env/env.dart';
import 'package:simple_project/core/http/http_provider.dart';

class BaseRepository {
  HttpProvider provider = HttpProvider();
  final String baseUrl = Env.baseUrl;
}
