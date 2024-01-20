import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';
import 'package:lojang_test/features/quotes/quote.dart';
import 'package:lojang_test/support/constants.dart';

import '../../services/local_storage/local_storage_helper.dart';
import '../../services/service/service_locator.dart';

class QuotesRoutes {
  final _apiProvider = getIt.get<ApiProvider>();
  final LocalStorageDb db = getIt.get<LocalStorageDb>();

  Future<List<Quote>> getQuotes({required int page}) async {
    final endpoint = Endpoint(path: 'quotes2?page=$page', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);
      final quotes = Quote.fromMapList(response.data['list']);

      await db.saveData(quotes: quotes);

      return quotes;
    } catch (e) {
      final response = await db.retrieveData(tableName: Constants.quotesTable);
      final quotes = Quote.fromMapList(response);

      if (quotes.isNotEmpty) return quotes;

      throw Exception('Erro de mapeamento');
    }
  }
}
