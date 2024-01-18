import 'package:flutter/material.dart';
import 'package:lojang_test/api/routes/articles_routes.dart';
import 'package:lojang_test/features/articles/article.dart';

class ArticleDetailsViewModel extends ChangeNotifier {
  final ArticlesRoutes articlesRoutes = ArticlesRoutes();

  Article? _detailedArticle;
  var _isLoading = false;

  Article? get detailedArticle => _detailedArticle;
  bool get isLoading => _isLoading;

  void initialize({required int id}) async {
    _detailedArticle = await getArticle(id: id);
  }

  Future<Article> getArticle({required int id}) async {
    _changeIsLoading(isLoading: true);
    final article = await articlesRoutes.getArticlesById(id: id);
    _changeIsLoading(isLoading: false);
    return article;
  }

  void _changeIsLoading({required bool isLoading}) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
