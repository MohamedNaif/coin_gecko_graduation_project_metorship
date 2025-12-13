import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/data_source/portfolio_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/simple_price_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

abstract class PortfolioRepository {
  Future<Result<SimplePriceModel>> getSimplePrice({
    required String ids,
    required String vsCurrencies,
    bool includeChange,
  });
}

@LazySingleton(as: PortfolioRepository)
class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioRemoteDataSource remoteDataSource;

  PortfolioRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<SimplePriceModel>> getSimplePrice({
    required String ids,
    required String vsCurrencies,
    bool includeChange = true,
  }) async {
    try {
      final response = await remoteDataSource.getSimplePrice(
          ids: ids, vsCurrencies: vsCurrencies, includeChange: includeChange);
      return Success(response);
    } on DioException catch (error) {
      return FailureResult(ServerFailure.fromDioException(dioException: error));
    } catch (error, stackTrace) {
      debugPrint('Unexpected error: $error');
      debugPrint('StackTrace: $stackTrace');
      return FailureResult(ServerFailure(errMessage: AppStrings.errorMessage));
    }
  }
}
