import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:quotemaker/Core/api/api_consumer.dart';
import 'package:quotemaker/Core/api/app_interceptor.dart';
import 'package:quotemaker/Core/api/end_points.dart';
import 'package:quotemaker/Core/api/status_code.dart';
import 'package:quotemaker/Core/error/exception.dart';

import '../../injection_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient;
    (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoint.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internetServerError;
      };

    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(String path, Map<String, dynamic> queryParam) async {
    final response = await client.get(path, queryParameters: queryParam);
    return _dynamicHandleJsonResponse(response);
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParam, Map<String, dynamic>? body}) async {
    final response =
        await client.post(path, queryParameters: queryParam, data: body);
    return _dynamicHandleJsonResponse(response);
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? queryParam, Map<String, dynamic>? body}) async {
    final response = await client.get(path, queryParameters: queryParam);
    return _dynamicHandleJsonResponse(response);
  }

  _dynamicHandleJsonResponse(Response<dynamic> response) {
    final jsonResponse = json.decode(response.data.toString());
    return jsonResponse;
  }
}
