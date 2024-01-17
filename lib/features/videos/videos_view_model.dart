import 'package:lojang_test/api/routes/video_routes.dart';
import 'package:lojang_test/features/videos/video.dart';

class VideosViewModel {
  final VideoRoutes videoRoutes = VideoRoutes();

  Future<List<Video>> getVideos({required int page}) async {
    return await videoRoutes.getVideos(page: page);
  }
}
