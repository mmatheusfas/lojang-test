import 'package:flutter/material.dart';
import 'package:lojang_test/api/routes/video_routes.dart';
import 'package:lojang_test/features/videos/video.dart';

import '../../api/errors/connectivity_error.dart';

class VideosViewModel extends ChangeNotifier {
  final VideoRoutes videoRoutes = VideoRoutes();

  // ignore: prefer_final_fields
  var _videos = <Video>[];
  bool _isLoading = false;
  var _errorMessage = '';

  List<Video> get videosList => _videos;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void getVideos() async {
    _changeIsLoading(isLoading: true);
    try {
      _videos = await videoRoutes.getVideos(page: 1);
      _changeIsLoading(isLoading: false);
      _errorMessage = '';
    } on ConnectivityError catch (e) {
      _errorMessage = e.message;
      _changeIsLoading(isLoading: false);
      return null;
    } catch (e) {
      _errorMessage = 'Erro desconhecido, tente novamente mais tarde';
      _changeIsLoading(isLoading: false);
    }
    return null;
  }

  void _changeIsLoading({required bool isLoading}) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
