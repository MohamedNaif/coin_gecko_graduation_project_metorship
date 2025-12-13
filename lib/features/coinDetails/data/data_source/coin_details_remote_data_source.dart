import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/api_query_paramter.dart';
import '../models/coin_details_model.dart';
import '../models/market_chart_response.dart';

part 'coin_details_remote_data_source.g.dart';

@lazySingleton
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class CoinRemoteDataSource {
  @factoryMethod
  factory CoinRemoteDataSource(Dio dio) = _CoinRemoteDataSource;

  // GET /coins/{id}
  @GET('${EndPoints.coins}/{id}')
  Future<CoinDetailsModel> getCoinDetails(
      @Path('id') String coinId,
      );

  // GET /coins/{id}/market_chart
  @GET('${EndPoints.coins}/{id}/${EndPoints.marketChart}')
  Future<MarketChartResponse> getMarketChart(
      @Path('id') String coinId,
      @Query(ApiQueryParameter.vsCurrency) String currency,
      @Query(ApiQueryParameter.days) String days,
      );
}
