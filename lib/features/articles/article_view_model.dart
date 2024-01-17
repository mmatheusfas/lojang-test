import 'package:lojang_test/api/routes/articles_routes.dart';
import 'package:lojang_test/features/articles/article.dart';

class ArticlesViewModel {
  final ArticlesRoutes articlesRoutes = ArticlesRoutes();

  Future<List<Article>> getArticles({required int page}) async {
    return await articlesRoutes.getArticles(page: page);
  }
}
