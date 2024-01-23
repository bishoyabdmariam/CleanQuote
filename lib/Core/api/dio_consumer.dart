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
  Future get(String path, {Map<String, dynamic>? queryParam}) async {
    try {
      final response = await client.get(path, queryParameters: queryParam);
      return _dynamicHandleJsonResponse(response);
    } on DioException catch (error) {
      _dynamicHandleDioException(error);
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? queryParam,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParam,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );
      return _dynamicHandleJsonResponse(response);
    } on DioException catch (error) {
      _dynamicHandleDioException(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? queryParam, Map<String, dynamic>? body}) async {
    try {
      final response = await client.get(path, queryParameters: queryParam);
      return _dynamicHandleJsonResponse(response);
    } on DioException catch (error) {
      _dynamicHandleDioException(error);
    }
  }

  _dynamicHandleJsonResponse(Response<dynamic> response) {
    final jsonResponse = json.decode(response.data.toString());
    return jsonResponse;
  }

  _dynamicHandleDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (dioException.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.forbidden:
          case StatusCode.unAuthorized:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.internetServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioExceptionType.cancel:
        break;

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
      case DioExceptionType.badCertificate:
        throw const NoInternetConnectionException();
    }
  }
}
