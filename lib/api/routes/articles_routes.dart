import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';

class ArticlesRoutes {
  final _apiProvider = ApiProvider();

  void getArticles() {
    final endpoint = Endpoint(path: 'articles2?page=1', method: 'GET');

    _apiProvider.request(endpoint: endpoint);
  }

  void getArticlesById({required int id}) {
    final endpoint = Endpoint(path: 'article-content?articleid=64', method: 'GET');

    _apiProvider.request(endpoint: endpoint);
  }
}
