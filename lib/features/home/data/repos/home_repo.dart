import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/datasources/home_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/trending_coin_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepo(this._homeRemoteDataSource);

  Future<Result<GlobalDataModel>> getGlobalData() async {
    try {
      final response = await _homeRemoteDataSource.getGlobalData();
      return Success(response.data!);
    } on DioException catch (e) {
      return FailureResult(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      return FailureResult(ServerFailure(errMessage: e.toString()));
    }
  }

  Future<Result<TrendingData>> getTrendingCoins() async {
    try {
      final response = await _homeRemoteDataSource.getTrendingCoins();
      return Success(response);
    } on DioException catch (e) {
      return FailureResult(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      return FailureResult(ServerFailure(errMessage: e.toString()));
    }
  }

  Future<Result<List<MarketCoinModel>>> getMarkets({
    String vsCurrency = 'usd',
    String order = 'market_cap_desc',
    int perPage = 20,
    int page = 1,
    bool sparkline = false,
  }) async {
    try {
      final response = await _homeRemoteDataSource.getMarkets(
        vsCurrency: vsCurrency,
        order: order,
        perPage: perPage,
        page: page,
        sparkline: sparkline,
      );
      return Success(response);
    } on DioException catch (e) {
      return FailureResult(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      return FailureResult(ServerFailure(errMessage: e.toString()));
    }
  }
}
