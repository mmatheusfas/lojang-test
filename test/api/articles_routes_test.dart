import 'package:flutter_test/flutter_test.dart';
import 'package:lojang_test/api/routes/articles_routes.dart';
import 'package:lojang_test/features/articles/article.dart';

void main() {
  final articlesRoutes = ArticlesRoutes();

  group('Test if getArticles and getArticleById are working as expected', () {
    test('Test if the getArticles method is returning a List of Articles', () async {
      final articles = await articlesRoutes.getArticles(page: 1);
      expect(articles.isNotEmpty, true);
      expect(articles, isA<List<Article>>());
    });

    test('Test if the getArticleById method is returning a Article', () async {
      final article = await articlesRoutes.getArticlesById(id: 12);
      expect(article, isA<Article>());
      expect(article.title, 'Aprendendo a meditar através da dificuldade');
    });
  });
}
