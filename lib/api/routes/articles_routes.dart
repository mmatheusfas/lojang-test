import 'package:lojang_test/api/errors/connectivity_error.dart';
import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';
import 'package:lojang_test/features/articles/article.dart';
import 'package:lojang_test/services/connectivity/check_connectivity.dart';
import 'package:lojang_test/services/service/service_locator.dart';

import '../../features/articles/article_details/detailed_article.dart';

class ArticlesRoutes {
  final _apiProvider = getIt.get<ApiProvider>();

  Future<List<Article>> getArticles({required int page}) async {
    final endpoint = Endpoint(path: 'articles2?page=$page', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);
      final articles = Article.fromMapList(response.data['list']);

      return articles;
    } catch (e) {
      final cachedResponse = await _apiProvider.request(endpoint: endpoint);
      final articles = Article.fromMapList(cachedResponse.data['list']);

      if (articles.isNotEmpty) return articles;

      if (!await CheckConnectivity.checkDeviceConnectivity()) throw ConnectivityError();

      throw Exception();
    }
  }

  Future<DetailedArticle> getArticlesById({required int id}) async {
    final endpoint = Endpoint(path: 'article-content?articleid=$id', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);

      return DetailedArticle.fromMap(response.data);
    } catch (e) {
      if (!await CheckConnectivity.checkDeviceConnectivity()) throw ConnectivityError();

      throw Exception();
    }
  }
}
