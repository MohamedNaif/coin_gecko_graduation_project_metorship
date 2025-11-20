import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_consumer.dart';
import 'app_interceptor.dart';
import 'end_points.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options
      ..followRedirects = false
      ..baseUrl = EndPoints.baseUrl
      ..receiveDataWhenStatusError = true;
    dio.interceptors.add(AppInterceptors(dio: Dio()));
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ));
    }
  }

  @override
  Future get({
    required String path,
    Object? body,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      data: body,
    );
    return response.data;
  }

  @override
  Future post({
    required String path,
    Object? body,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.post(
      path,
      queryParameters: queryParameters,
      data: body,
      options: Options(
        headers: headers,
        contentType: formData != null ? 'multipart/form-data' : null,
      ),
    );
    return response.data;
  }

  @override
  Future put({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.put(
      path,
      data: body,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future patch({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.patch(
      path,
      data: body,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future delete({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.delete(
      path,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
