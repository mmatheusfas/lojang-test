import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';
import 'package:lojang_test/features/videos/video.dart';

class VideoRoutes {
  final _apiProvider = ApiProvider();

  Future<List<Video>> getVideos({required int page}) async {
    final endpoint = Endpoint(path: 'videos?page=$page', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);

      return Video.fromMapList(response.data);
    } catch (e) {
      throw Exception('Erro de mapeamento');
    }
  }
}
