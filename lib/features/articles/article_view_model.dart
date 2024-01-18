import 'package:flutter/material.dart';
import 'package:lojang_test/api/routes/articles_routes.dart';
import 'package:lojang_test/features/articles/article.dart';

class ArticlesViewModel extends ChangeNotifier {
  final ArticlesRoutes articlesRoutes = ArticlesRoutes();
  final ScrollController _scrollController = ScrollController();

  // ignore: prefer_final_fields
  var _articles = <Article>[];
  int _page = 1;
  var _isLoading = false;

  ScrollController get getScrollController => _scrollController;
  int get getPage => _page;
  List<Article> get articlesList => _articles;
  bool get isLoading => _isLoading;

  void getArticles() async {
    _changeIsLoading(isLoading: true);
    final newArticles = await articlesRoutes.getArticles(page: _page);
    for (var article in newArticles) {
      _articles.add(article);
    }
    _page++;
    _changeIsLoading(isLoading: false);
  }

  void updateVideosList() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoading) {
      getArticles();
    }
  }

  void _changeIsLoading({required bool isLoading}) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
