import 'package:flutter_test/flutter_test.dart';
import 'package:lojang_test/api/routes/video_routes.dart';
import 'package:lojang_test/features/videos/video.dart';

void main() {
  final videosRoutes = VideoRoutes();

  test('Test if the getVideos method is returning a List of Videos', () async {
    final videos = await videosRoutes.getVideos(page: 1);
    expect(videos.isNotEmpty, true);
    expect(videos, isA<List<Video>>());
  });
}
