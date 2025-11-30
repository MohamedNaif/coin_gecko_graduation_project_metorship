// // import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/routing/app_router.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
// // import 'package:coin_gecko_graduation_project_metorship/main.dart';

// import '../api/status_code.dart';
// import '../constants/app_strings.dart';
// import '../storage/cache_helper.dart';
// import 'end_points.dart';

// class AppInterceptors extends Interceptor {
//   final Dio dio;

//   AppInterceptors({required this.dio});

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     String? authToken = AppSharedPreferences.getString(
//       key: AppStrings.accessToken,
//     );
//     if (authToken != null && authToken.isNotEmpty) {
//       options.headers['Authorization'] = 'Bearer $authToken';
//     }
//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // ToDo
//     super.onResponse(response, handler);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (kDebugMode) {
//       // log("err.response?.statusCode ${err.response?.statusCode}");
//     }

//     // Token refresh logic commented out as it's not currently supported/needed for CoinGecko public API
//     /*
//     if (err.response?.statusCode == StatusCode.unauthorized) {
//       String? refreshToken = AppSharedPreferences.getString(
//         key: AppStrings.refreshToken,
//       );

//       if (refreshToken != null && refreshToken.isNotEmpty) {
//         // log("refreshToken: $refreshToken");

//         try {
//           // log("Making refresh token request to: ${EndPoints.refreshToken}");
//           // log("Request data: ${{"token": refreshToken}}");

//           // Create a new Dio instance to avoid interceptor recursion
//           final refreshDio = Dio(
//             BaseOptions(
//               baseUrl: EndPoints.baseUrl,
//               connectTimeout: dio.options.connectTimeout,
//               receiveTimeout: dio.options.receiveTimeout,
//               headers: {'Content-Type': 'application/json'},
//             ),
//           );

//           // Set base URL - if main dio doesn't have one, use a fallback
//           String baseUrl = dio.options.baseUrl;
//           if (baseUrl.isEmpty) {
//             // You need to replace this with your actual API base URL
//             baseUrl = EndPoints.baseUrl; // Replace with your actual domain
//             // log("Warning: Main Dio instance has no base URL, using fallback: $baseUrl");
//           }

//           refreshDio.options.baseUrl = baseUrl;
//           refreshDio.options.connectTimeout = dio.options.connectTimeout;
//           refreshDio.options.receiveTimeout = dio.options.receiveTimeout;

//           // Ensure the endpoint starts with /
//           String refreshEndpoint = EndPoints.refreshToken;

//           // log("Final refresh endpoint: $refreshEndpoint");
//           // log("Base URL: ${refreshDio.options.baseUrl}");
//           // log("Full URL will be: ${refreshDio.options.baseUrl}$refreshEndpoint");

//           final response = await refreshDio.post(
//             refreshEndpoint,
//             data: {"token": refreshToken},
//             options: Options(headers: {'Content-Type': 'application/json'}),
//           );

//           // log("Refresh response status: ${response.statusCode}");
//           // log("Refresh response data: ${response.data}");

//           if (response.data != null && response.data["accessToken"] != null) {
//             String newAccessToken = response.data["accessToken"];

//             // log("New access token received: ${newAccessToken.substring(0, 20)}...");

//             // Save new access token
//             await AppSharedPreferences.setString(
//               value: newAccessToken,
//               key: AppStrings.accessToken,
//             );

//             // Update the failed request with new token
//             err.requestOptions.headers['Authorization'] =
//                 'Bearer $newAccessToken';

//             // log("Updated request headers with new token");

//             // Retry the original request
//             final retryResponse = await dio.fetch(err.requestOptions);
//             // log("Retry successful: ${retryResponse.statusCode}");

//             return handler.resolve(retryResponse);
//           } else {
//             // log("Invalid response format: missing accessToken");
//             // log("Available keys in response: ${response.data?.keys}");
//             throw Exception("Invalid refresh token response format");
//           }
//         } catch (e) {
//           // log("Refresh token failed with error: $e");
//           if (e is DioException) {
//             // log("DioException type: ${e.type}");
//             // log("DioException message: ${e.message}");
//             // log("DioException response: ${e.response?.data}");
//             // log("DioException status code: ${e.response?.statusCode}");
//             // log("DioException request options: ${e.requestOptions.uri}");
//             // log("DioException error: ${e.error}");
//           }
//           // Refresh failed, logout
//           await AppSharedPreferences.sharedPreferences.clear();
//           // AppRouter().generateRoute(RouteSettings(name: Routes.splashScreen));
//           return handler.reject(err);
//         }
//       } else {
//         // log("No refresh token available");
//         await AppSharedPreferences.sharedPreferences.clear();
//         // router.go(Routes.login);
//         return handler.reject(err);
//       }
//     } else if (err.response?.statusCode == StatusCode.forbidden) {
//       // log("Forbidden - clearing preferences and redirecting to login");
//       await AppSharedPreferences.sharedPreferences.clear();
//       // router.go(Routes.login);
//     }
//     */

//     super.onError(err, handler);
//   }
// }

// /*

// import 'package:dio/dio.dart';s

// import '../api/status_code.dart';
// import 'app_strings.dart';
// import 'cache_helper.dart';
// import 'end_points.dart';

// class AppInterceptors extends Interceptor {
//   final Dio dio;

//   AppInterceptors({
//     required this.dio,
//   });

//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) {
//     String? authToken =
//         AppSharedPreferences.getString(key: AppStrings.accessToken);
//     if (authToken != null && authToken.isNotEmpty) {
//       options.headers['Authorization'] = 'Bearer $authToken';
//     }
//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // ToDo
//     super.onResponse(response, handler);
//   }

//   @override
//   void onError(
//     DioException err,
//     ErrorInterceptorHandler handler,
//   ) async {
//     if (err.response?.statusCode == StatusCode.unauthorized) {
//       String? accessToken =
//           AppSharedPreferences.getString(key: AppStrings.accessToken);
//       String? refreshToken =
//           AppSharedPreferences.getString(key: AppStrings.refreshToken);
//       print(accessToken);
//       print(refreshToken);
//       if (refreshToken != null && refreshToken.isNotEmpty) {
//         dio.options.baseUrl = EndPoints.baseUrl;
//         await dio.post(
//           EndPoints.refreshToken,
//           queryParameters: {
//             "token": refreshToken,
//           },
//         ).then(
//           (value) {
//             print("value : $value");
//             String token = value.data["accessToken"];

//             AppSharedPreferences.setString(
//                 value: token, key: AppStrings.accessToken);
//           },
//         );
//         accessToken =
//             AppSharedPreferences.getString(key: AppStrings.accessToken);
//         err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
//         return handler.resolve(await dio.fetch(err.requestOptions));
//       }
//     } else if (err.response?.statusCode == StatusCode.forbidden) {
//       //   router.go('/');
//     }
//     super.onError(err, handler);
//   }
// }


//  */
