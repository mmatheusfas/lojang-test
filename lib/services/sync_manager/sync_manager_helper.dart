import 'dart:async';

import 'package:lojang_test/api/routes/articles_routes.dart';
import 'package:lojang_test/api/routes/quotes_routes.dart';
import 'package:lojang_test/api/routes/video_routes.dart';
import 'package:lojang_test/features/articles/article.dart';
import 'package:lojang_test/features/quotes/quote.dart';
import 'package:lojang_test/features/videos/video.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SyncManagerHelper {
  final ArticlesRoutes articlesRoutes = ArticlesRoutes();
  final QuotesRoutes quotesRoutes = QuotesRoutes();
  final VideoRoutes videoRoutes = VideoRoutes();

  Future<void> synchronizeWithAPI() async {
    /*  final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return;
    } */

    final lastSyncTime = await _getLastSyncTime();
    final currentTime = DateTime.now();

    if (lastSyncTime == null || currentTime.difference(lastSyncTime).inDays >= 1) {
      await _fetchArticlesFromAPI();
      await _fetchQuotesFromAPI();
      await _fetchVideosFromAPI();

      await _updateLastSyncTime(currentTime);
    }
  }

  void scheduleSynchronization() async {
    final lastSyncTime = await _getLastSyncTime();

    if (lastSyncTime == null) synchronizeWithAPI();

    Timer.periodic(const Duration(hours: 24), (Timer timer) {
      synchronizeWithAPI();
    });
  }

  Future<List<Article>> _fetchArticlesFromAPI() async {
    return await articlesRoutes.getArticles(page: 1);
  }

  Future<List<Quote>> _fetchQuotesFromAPI() async {
    return await quotesRoutes.getQuotes(page: 1);
  }

  Future<List<Video>> _fetchVideosFromAPI() async {
    return await videoRoutes.getVideos(page: 1);
  }

  Future<DateTime?> _getLastSyncTime() async {
    final lastSyncDateString = await SharedPreferences.getInstance().then(
      (prefs) => prefs.getString('lastSyncTime'),
    );

    if (lastSyncDateString == null) return null;

    final lastSyncDate = DateTime.parse(lastSyncDateString);
    return lastSyncDate;
  }

  Future<void> _updateLastSyncTime(DateTime currentTime) async {
    SharedPreferences.getInstance().then((prefs) => prefs.setString('lastSyncTime', currentTime.toString()));
  }
}
