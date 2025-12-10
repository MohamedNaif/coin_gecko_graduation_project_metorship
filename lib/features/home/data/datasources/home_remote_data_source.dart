import 'package:coin_gecko_graduation_project_metorship/core/api/end_points.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/trending_coin_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_remote_data_source.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
@injectable
abstract class HomeRemoteDataSource {
  @factoryMethod
  factory HomeRemoteDataSource(Dio dio) = _HomeRemoteDataSource;

  @GET(EndPoints.global)
  Future<GlobalDataResponse> getGlobalData();

  @GET(EndPoints.trending)
  Future<TrendingData> getTrendingCoins();

  @GET(EndPoints.markets)
  Future<List<MarketCoinModel>> getMarkets({
    @Query('vs_currency') String vsCurrency = 'usd',
    @Query('order') String order = 'market_cap_desc',
    @Query('per_page') int perPage = 20,
    @Query('page') int page = 1,
    @Query('sparkline') bool sparkline = false,
  });
}
