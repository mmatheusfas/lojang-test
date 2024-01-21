import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lojang_test/api/errors/connectivity_error.dart';
import 'package:lojang_test/api/models/endpoint.dart';
import 'package:lojang_test/support/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();

  ApiProvider() {
    if (kDebugMode) {
      _dio.interceptors.add(ChuckerDioInterceptor());
    }
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
    } on ConnectivityError catch (error) {
      throw Exception(error.message);
    }
  }
}
