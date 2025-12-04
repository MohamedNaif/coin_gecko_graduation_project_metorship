import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/market/data/models/coin_model.dart';
import '../../features/market/data/models/search_coin_model.dart';
import '../../features/market/data/models/search_response.dart';
import 'end_points.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(EndPoints.markets)
  Future<List<CoinModel>> getMarketCoins(
    @Query("vs_currency") String currency,
    @Query("order") String order,
    @Query("per_page") int perPage,
    @Query("page") int page,
  );
  @GET(EndPoints.search)
  Future<SearchResponse> searchCoins(
    @Query("query") String keyword,
  );
}