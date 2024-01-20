import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';
import 'package:lojang_test/features/videos/video.dart';
import 'package:lojang_test/support/constants.dart';

import '../../services/local_storage/local_storage_helper.dart';
import '../../services/service/service_locator.dart';

class VideoRoutes {
  final _apiProvider = getIt.get<ApiProvider>();
  final LocalStorageDb db = getIt.get<LocalStorageDb>();

  Future<List<Video>> getVideos({required int page}) async {
    final endpoint = Endpoint(path: 'videos?page=$page', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);
      final videos = Video.fromMapList(response.data);

      await db.saveData(videos: videos);

      return videos;
    } catch (e) {
      final response = await db.retrieveData(tableName: Constants.videosTable);
      final videos = Video.fromMapList(response);

      if (videos.isNotEmpty) return videos;

      throw Exception('Erro de mapeamento');
    }
  }
}
