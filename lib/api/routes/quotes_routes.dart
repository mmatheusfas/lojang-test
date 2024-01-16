import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';
import 'package:lojang_test/features/quotes/quote.dart';

class QuotesRoutes {
  final _apiProvider = ApiProvider();

  Future<List<Quote>> getQuotes({required int page}) async {
    final endpoint = Endpoint(path: 'quotes2?page=$page', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);

      return Quote.fromMapList(response.data['list']);
    } catch (e) {
      throw Exception('Erro de mapeamento');
    }
  }
}
