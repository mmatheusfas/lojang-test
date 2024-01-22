import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';
import 'package:lojang_test/features/videos/video.dart';

import '../../services/connectivity/check_connectivity.dart';
import '../../services/service/service_locator.dart';
import '../errors/connectivity_error.dart';

class VideoRoutes {
  final _apiProvider = getIt.get<ApiProvider>();

  Future<List<Video>> getVideos({required int page}) async {
    final endpoint = Endpoint(path: 'videos?page=$page', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);
      final videos = Video.fromMapList(response.data);

      return videos;
    } catch (e) {
      final cachedResponse = await _apiProvider.request(endpoint: endpoint);
      final videos = Video.fromMapList(cachedResponse.data);

      if (videos.isNotEmpty) return videos;

      if (!await CheckConnectivity.checkDeviceConnectivity()) throw ConnectivityError();

      throw Exception();
    }
  }
}
