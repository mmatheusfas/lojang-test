import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/api/setup/api_provider.dart';

class QuotesRoutes {
  final _apiProvider = ApiProvider();

  void getQuotes() {
    final endpoint = Endpoint(path: 'quotes2?page=1', method: 'GET');

    _apiProvider.request(endpoint: endpoint);
  }
}
