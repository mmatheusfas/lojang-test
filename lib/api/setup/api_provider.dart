import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/support/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  final Dio _dio = Dio();

  ApiProvider() {
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger());
    }
  }

  Future<dynamic> request({required Endpoint endpoint}) async {
    _dio.options.baseUrl = Constants.baseUrl;

    final requestOptions = Options(
      method: endpoint.method,
      contentType: ContentType.json.value,
      headers: {
        'Authorization': 'Bearer ${Constants.authToken}',
      },
    );

    try {
      return _dio.request(
        endpoint.path,
        options: requestOptions,
      );
    } on DioException catch (error) {
      throw Exception('Erro na requisição: ${error.message}');
    }
  }
}
