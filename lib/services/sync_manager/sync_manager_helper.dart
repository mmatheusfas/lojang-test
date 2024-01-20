import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lojang_test/api/routes/articles_routes.dart';
import 'package:lojang_test/api/routes/quotes_routes.dart';
import 'package:lojang_test/api/routes/video_routes.dart';
import 'package:lojang_test/features/articles/article.dart';
import 'package:lojang_test/features/quotes/quote.dart';
import 'package:lojang_test/features/videos/video.dart';
import 'package:lojang_test/services/local_storage/local_storage_helper.dart';
import 'package:lojang_test/services/service/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SyncManagerHelper {
  final ArticlesRoutes articlesRoutes = ArticlesRoutes();
  final QuotesRoutes quotesRoutes = QuotesRoutes();
  final VideoRoutes videoRoutes = VideoRoutes();
  final db = getIt.get<LocalStorageDb>();

  Future<void> synchronizeWithAPI() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return;
    }

    final lastSyncTime = await _getLastSyncTime();
    final currentTime = DateTime.now();

    if (lastSyncTime == null || currentTime.difference(lastSyncTime).inDays >= 1) {
      final articles = await fetchArticlesFromAPI();
      final quotes = await fetchQuotesFromAPI();
      final videos = await fetchVideosFromAPI();

      await db.saveData(articles: articles);
      await db.saveData(quotes: quotes);
      await db.saveData(videos: videos);

      await _updateLastSyncTime(currentTime);
    }
  }

  Future<List<Article>> fetchArticlesFromAPI() async {
    return await articlesRoutes.getArticles(page: 1);
  }

  Future<List<Quote>> fetchQuotesFromAPI() async {
    return await quotesRoutes.getQuotes(page: 1);
  }

  Future<List<Video>> fetchVideosFromAPI() async {
    return await videoRoutes.getVideos(page: 1);
  }

  void scheduleSynchronization() {
    Timer.periodic(const Duration(hours: 24), (Timer timer) {
      synchronizeWithAPI();
    });
  }

  Future<DateTime?> _getLastSyncTime() async {
    final lastSyncDateString = await SharedPreferences.getInstance().then(
      (prefs) => prefs.getString('lastSyncTime'),
    );
    final lastSyncDate = DateTime.parse(lastSyncDateString ?? '');
    return lastSyncDate;
  }

  Future<void> _updateLastSyncTime(DateTime currentTime) async {
    SharedPreferences.getInstance().then((prefs) => prefs.setString('lastSyncTime', currentTime.toString()));
  }
}
