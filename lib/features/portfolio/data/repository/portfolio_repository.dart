import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/data_source/portfolio_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/simple_price_model.dart';
import 'package:dio/dio.dart';

abstract class PortfolioRepository {
  Future<Result<SimplePriceModel>> getSimplePrice({
    required String id,
    required String vsCurrencies,
    bool includeChange,
  });
}

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioRemoteDataSource remoteDataSource;

  PortfolioRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<SimplePriceModel>> getSimplePrice({
    required String id,
    required String vsCurrencies,
    bool includeChange = true,
  }) async {
    try {
      final response = await remoteDataSource.getSimplePrice(
          ids: id, vsCurrencies: vsCurrencies, includeChange: includeChange);
      return Success(response);
    } on DioException catch (error) {
      return FailureResult(ServerFailure.fromDioException(dioException: error));
    } on Exception catch (error) {
      return FailureResult(ServerFailure(errMessage: error.toString()));
    }
  }
}
