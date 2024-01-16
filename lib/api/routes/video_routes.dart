import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';

class VideoRoutes {
  final _apiProvider = ApiProvider();

  void getVideos() {
    final endpoint = Endpoint(path: 'videos?page=1', method: 'GET');

    _apiProvider.request(endpoint: endpoint);
  }
}
