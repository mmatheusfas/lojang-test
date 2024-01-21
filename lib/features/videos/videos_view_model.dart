import 'package:flutter/material.dart';
import 'package:lojang_test/api/routes/video_routes.dart';
import 'package:lojang_test/features/videos/video.dart';

class VideosViewModel extends ChangeNotifier {
  final VideoRoutes videoRoutes = VideoRoutes();

  // ignore: prefer_final_fields
  var _videos = <Video>[];
  bool _isLoading = false;

  List<Video> get videosList => _videos;
  bool get isLoading => _isLoading;

  void getVideos() async {
    _changeIsLoading(isLoading: true);
    try {
      _videos = await videoRoutes.getVideos(page: 1);
      _changeIsLoading(isLoading: false);
    } catch (e) {
      _changeIsLoading(isLoading: false);
      throw Exception();
    }
  }

  void _changeIsLoading({required bool isLoading}) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
