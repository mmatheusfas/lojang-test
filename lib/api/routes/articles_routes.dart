import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';
import 'package:lojang_test/features/articles/article.dart';

class ArticlesRoutes {
  final _apiProvider = ApiProvider();

  Future<List<Article>> getArticles({required int page}) async {
    final endpoint = Endpoint(path: 'articles2?page=$page', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);

      return Article.fromMapList(response.data['list']);
    } catch (e) {
      throw Exception('Erro Mapeamento');
    }
  }

  Future<Article> getArticlesById({required int id}) async {
    final endpoint = Endpoint(path: 'article-content?articleid=$id', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);

      return Article.fromMap(response.data);
    } catch (e) {
      throw Exception('Erro Mapeamento');
    }
  }
}
