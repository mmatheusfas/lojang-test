import 'package:get_it/get_it.dart';
import 'package:lojang_test/api/setup/api_provider.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<ApiProvider>(ApiProvider());
}
