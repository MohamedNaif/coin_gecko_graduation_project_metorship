import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/trending_coin_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/market/data/models/coin_model.dart';
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

  @GET(EndPoints.global)
  Future<GlobalDataModel> getGlobalData();

  @GET(EndPoints.trending)
  Future<TrendingData> getTrendingCoins();

  @GET(EndPoints.markets)
  Future<List<MarketCoinModel>> getMarkets(
    @Query('vs_currency') String vsCurrency,
    @Query('order') String order,
    @Query('per_page') int perPage,
    @Query('page') int page,
    @Query('sparkline') bool sparkline,
  );
}