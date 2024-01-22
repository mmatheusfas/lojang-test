import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';
import 'package:lojang_test/features/quotes/quote.dart';

import '../../services/connectivity/check_connectivity.dart';
import '../../services/service/service_locator.dart';
import '../errors/connectivity_error.dart';

class QuotesRoutes {
  final _apiProvider = getIt.get<ApiProvider>();

  Future<List<Quote>> getQuotes({required int page}) async {
    final endpoint = Endpoint(path: 'quotes2?page=$page', method: 'GET');

    try {
      final response = await _apiProvider.request(endpoint: endpoint);
      final quotes = Quote.fromMapList(response.data['list']);

      return quotes;
    } catch (e) {
      final cachedResponse = await _apiProvider.request(endpoint: endpoint);
      final quotes = Quote.fromMapList(cachedResponse.data['list']);

      if (quotes.isNotEmpty) return quotes;

      if (!await CheckConnectivity.checkDeviceConnectivity()) throw ConnectivityError();

      throw Exception();
    }
  }
}
