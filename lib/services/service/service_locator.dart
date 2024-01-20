import 'package:get_it/get_it.dart';
import 'package:lojang_test/api/setup/api_provider.dart';
import 'package:lojang_test/services/local_storage/local_storage_helper.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<LocalStorageDb>(LocalStorageDb());
  getIt.registerSingleton<ApiProvider>(ApiProvider());
}
