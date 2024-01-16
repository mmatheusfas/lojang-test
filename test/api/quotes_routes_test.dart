import 'package:flutter_test/flutter_test.dart';
import 'package:lojang_test/api/routes/quotes_routes.dart';
import 'package:lojang_test/features/quotes/quote.dart';

void main() {
  final quotesRoutes = QuotesRoutes();

  test('Test if the getQuotes method is returning a List of Quotes', () async {
    final quotes = await quotesRoutes.getQuotes(page: 1);
    expect(quotes.isNotEmpty, true);
    expect(quotes, isA<List<Quote>>());
  });
}
