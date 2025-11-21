
import 'package:coin_gecko_graduation_project_metorship/core/api/api_services.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  LogInterceptor provideLogger() {
    return LogInterceptor(requestBody: true, responseBody: true);
  }

  @Singleton()
  Dio provideDio(LogInterceptor logInterceptor,) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        baseUrl: "Constants.baseUrl",
      ),
    );
    // dio.options.headers["Content-Type"]="multipart/form-data";
    // dio.options.contentType="multipart/form-data";
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // final token = await readSecureData(Constants.userToken);

          // log("token : $token");
          // options.headers['Authorization'] = 'Bearer $token';
          // if (token != null && token.isNotEmpty) {
          //   options.headers['Authorization'] = 'Bearer $token';
          //   log("token : $token");
          // }
          // options.headers['Accept-Language'] = appConfigProvider.appLanguage;
          // return handler.next(options);
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
