import 'dart:developer';

import 'package:coin_gecko_graduation_project_metorship/core/api/api_services.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @lazySingleton
  PrettyDioLogger provideLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
  }

  @Singleton()
  Dio provideDio(
    PrettyDioLogger logInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        baseUrl: "https://api.coingecko.com/api/v3",
      ),
    );
    dio.options.headers["Content-Type"] = "multipart/form-data";
    // dio.options.contentType="multipart/form-data";
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = '';

          log("token : $token");
          options.headers['Authorization'] = 'Bearer $token';
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            log("token : $token");
          }

          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(logInterceptor);
    return dio;
  }

  @Singleton()
  ApiService provideApiService(Dio dio) {
    return ApiService(dio);
  }
}
