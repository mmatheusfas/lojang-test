import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';
import 'package:lojang_test/features/articles/article.dart';
import 'package:lojang_test/services/connectivity/check_connectivity.dart';
import 'package:lojang_test/services/local_storage/local_storage_helper.dart';
import 'package:lojang_test/services/service/service_locator.dart';

import '../../features/articles/article_details/detailed_article.dart';
import '../../support/constants.dart';
import '../errors/connectivity_error.dart';

class ArticlesRoutes {
  final _apiProvider = getIt.get<ApiProvider>();
  final LocalStorageDb db = getIt.get<LocalStorageDb>();

  Future<List<Article>> getArticles({required int page}) async {
    final endpoint = Endpoint(path: 'articles2?page=$page', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);
      final articles = Article.fromMapList(response.data['list']);
      await db.saveData(articles: articles);

      return articles;
    } catch (e) {
      final response = await db.retrieveData(tableName: Constants.articlesTable);
      final articles = Article.fromMapList(response);

      if (articles.isNotEmpty) return articles;

      throw Exception('Erro Mapeamento');
    }
  }

  Future<DetailedArticle> getArticlesById({required int id}) async {
    if (!await CheckConnectivity.checkDeviceConnectivity()) {
      throw ConnectivityError();
    }

    final endpoint = Endpoint(path: 'article-content?articleid=$id', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);

      return DetailedArticle.fromMap(response.data);
    } catch (e) {
      throw Exception('Erro Mapeamento');
    }
  }
}
