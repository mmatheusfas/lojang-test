import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/support/constants.dart';
import 'package:path_provider/path_provider.dart';

class ApiProvider {
  final Dio _dio = Dio();

  ApiProvider() {
    _initializeDio();
  }

  Future<Response<dynamic>> request({required Endpoint endpoint}) async {
    _dio.options.baseUrl = Constants.baseUrl;

    final requestOptions = Options(
      method: endpoint.method,
      contentType: ContentType.json.value,
      headers: {
        'Authorization': 'Bearer ${Constants.authToken}',
      },
    );

    try {
      final response = await _dio.get(
        endpoint.path,
        options: requestOptions,
      );
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void _initializeDio() async {
    var cacheDir = await getTemporaryDirectory();

    var cacheStore = HiveCacheStore(
      cacheDir.path,
      hiveBoxName: "lojong_test",
    );

    var customCacheOptions = CacheOptions(
      store: cacheStore,
      policy: CachePolicy.forceCache,
      priority: CachePriority.high,
      maxStale: const Duration(days: 7),
      hitCacheOnErrorExcept: [401, 404],
      keyBuilder: (request) {
        return request.uri.toString();
      },
      allowPostMethod: false,
    );

    if (kDebugMode) {
      _dio.interceptors.addAll(
        [
          ChuckerDioInterceptor(),
          DioCacheInterceptor(options: customCacheOptions),
        ],
      );
    } else {
      _dio.interceptors.add(DioCacheInterceptor(options: customCacheOptions));
    }
  }
}
