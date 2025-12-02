import 'package:coin_gecko_graduation_project_metorship/core/api/api_query_paramter.dart';
import 'package:coin_gecko_graduation_project_metorship/core/api/end_points.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/simple_price_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'portfolio_remote_data_source.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
@injectable
abstract class PortfolioRemoteDataSource {
  @factoryMethod
  factory PortfolioRemoteDataSource(Dio dio) = _PortfolioRemoteDataSource;

  @GET(EndPoints.portfolio)
  Future<SimplePriceModel> getSimplePrice({
    @Query(ApiQueryParameter.ids) required String ids,
    @Query(ApiQueryParameter.vsCurrencies) required String vsCurrencies,
    @Query(ApiQueryParameter.include24hrChange) bool includeChange = true,
  });
}
