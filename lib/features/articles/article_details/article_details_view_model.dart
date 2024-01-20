import 'package:flutter/material.dart';
import 'package:lojang_test/api/errors/connectivity_error.dart';
import 'package:lojang_test/api/routes/articles_routes.dart';
import 'package:lojang_test/features/articles/article_details/detailed_article.dart';

class ArticleDetailsViewModel extends ChangeNotifier {
  final ArticlesRoutes articlesRoutes = ArticlesRoutes();

  DetailedArticle? _detailedArticle;
  var _isLoading = false;
  String _connectivityError = '';

  DetailedArticle? get detailedArticle => _detailedArticle;
  bool get isLoading => _isLoading;
  String get connectivityError => _connectivityError;

  void initialize({required int id}) async {
    _detailedArticle = await getArticle(id: id);
  }

  Future<DetailedArticle?> getArticle({required int id}) async {
    _changeIsLoading(isLoading: true);
    try {
      final article = await articlesRoutes.getArticlesById(id: id);
      _changeIsLoading(isLoading: false);
      _connectivityError = '';
      return article;
    } on ConnectivityError catch (e) {
      _connectivityError = e.message;
      _changeIsLoading(isLoading: false);
      return null;
    }
  }

  void didTapReload({required int id}) {
    _changeIsLoading(isLoading: true);
    try {
      initialize(id: id);
    } on ConnectivityError catch (e) {
      _connectivityError = e.message;
      _changeIsLoading(isLoading: false);
      return;
    }
  }

  void _changeIsLoading({required bool isLoading}) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
