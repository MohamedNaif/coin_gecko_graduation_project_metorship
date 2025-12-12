import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/api_query_paramter.dart';
import '../models/coin_model.dart';
import '../models/search_response.dart';

part 'market_remote_data_source.g.dart';

@lazySingleton
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class MarketRemoteDataSource {
  @factoryMethod
  factory MarketRemoteDataSource(Dio dio) = _MarketRemoteDataSource;

  @GET(EndPoints.markets)
  Future<List<CoinModel>> getMarketCoins(
      @Query(ApiQueryParameter.vsCurrency) String currency,
      @Query(ApiQueryParameter.order) String order,
      @Query(ApiQueryParameter.perPage) int perPage,
      @Query(ApiQueryParameter.page) int page,
      );

  @GET(EndPoints.search)
  Future<SearchResponse> searchCoins(
      @Query(ApiQueryParameter.query) String keyword,
      );
}
