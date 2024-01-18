import 'package:flutter/material.dart';
import 'package:lojang_test/api/routes/quotes_routes.dart';
import 'package:lojang_test/features/quotes/quote.dart';

class QuotesViewModel extends ChangeNotifier {
  final QuotesRoutes quotesRoutes = QuotesRoutes();
  final ScrollController _scrollController = ScrollController();

  // ignore: prefer_final_fields
  var _quotes = <Quote>[];

  var _page = 1;
  var _isLoading = false;

  ScrollController get getScrollController => _scrollController;
  int get getPage => _page;
  List<Quote> get quotesList => _quotes;
  bool get isLoading => _isLoading;

  void getQuotes() async {
    _changeIsLoading(isLoading: true);
    final newQuotes = await quotesRoutes.getQuotes(page: _page);
    for (var quotes in newQuotes) {
      _quotes.add(quotes);
    }
    _page++;
    _changeIsLoading(isLoading: false);
  }

  void updateQuotesList() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoading) {
      getQuotes();
    }
  }

  void _changeIsLoading({required bool isLoading}) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
