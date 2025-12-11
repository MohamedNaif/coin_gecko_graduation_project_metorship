import 'package:coin_gecko_graduation_project_metorship/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class PaymentDioModule {
  @Named("paymentDio")
  @lazySingleton
  Dio providePaymentDio(PrettyDioLogger logger) {
    final dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.paymentBaseUrl,
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET_KEY']}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );
    dio.interceptors.add(logger);
    return dio;
  }
}
