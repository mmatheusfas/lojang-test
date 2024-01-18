import 'package:flutter/material.dart';
import 'package:lojang_test/api/routes/video_routes.dart';
import 'package:lojang_test/features/videos/video.dart';

class VideosViewModel extends ChangeNotifier {
  final VideoRoutes videoRoutes = VideoRoutes();

  Future<List<Video>> getVideos() async {
    return await videoRoutes.getVideos(page: 1);
  }
}
