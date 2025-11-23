
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "Constants.baseUrl")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
}