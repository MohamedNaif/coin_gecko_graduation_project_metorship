import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/data_source/portfolio_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/coin_data.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/simple_price_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/repository/portfolio_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'portfolio_repository_test.mocks.dart';

@GenerateMocks([PortfolioRemoteDataSource])
void main() {
  late PortfolioRemoteDataSource portfolioRemoteDataSource;
  late PortfolioRepository portfolioRepository;

  setUp(() {
    portfolioRemoteDataSource = MockPortfolioRemoteDataSource();
    portfolioRepository = PortfolioRepositoryImpl(portfolioRemoteDataSource);
  });
  group('PortfolioRepositoryImpl Tests', () {
    test('getSimplePrice should return Success with SimplePriceModel',
        () async {
      //arrange
      final mockSimplePriceModel = SimplePriceModel(
        coins: [CoinData(name: 'name', usd: 2, usdChange: 21)],
      );

      //act
      when(portfolioRemoteDataSource.getSimplePrice(
              ids: 'ids', vsCurrencies: 'vsCurrencies', includeChange: true))
          .thenAnswer((_) async => mockSimplePriceModel);

      final result = await portfolioRepository.getSimplePrice(
        ids: 'ids',
        vsCurrencies: 'vsCurrencies',
        includeChange: true,
      );

      //assert
      expect(result, isA<Success<SimplePriceModel>>());
    });
  });
  test('getSimplePrice should return Failure with ServerFailure', () async {
    //arrange
    final mockDioException = DioException(requestOptions: RequestOptions());
    when(portfolioRemoteDataSource.getSimplePrice(
            ids: 'ids', vsCurrencies: 'vsCurrencies', includeChange: true))
        .thenThrow(mockDioException);

    final result = await portfolioRepository.getSimplePrice(
      ids: 'ids',
      vsCurrencies: 'vsCurrencies',
      includeChange: true,
    );

    //assert
    expect(result, isA<FailureResult<SimplePriceModel>>());
    final failure = (result as FailureResult<SimplePriceModel>).failure;
    expect(failure, isA<ServerFailure>());
  });
  test('getSimplePrice should return Failure with ServerFailure', () async {
    //arrange
    when(portfolioRemoteDataSource.getSimplePrice(
            ids: 'ids', vsCurrencies: 'vsCurrencies', includeChange: true))
        .thenThrow(Exception());

    final result = await portfolioRepository.getSimplePrice(
      ids: 'ids',
      vsCurrencies: 'vsCurrencies',
      includeChange: true,
    );

    //assert
    expect(result, isA<FailureResult<SimplePriceModel>>());
    final failure = (result as FailureResult<SimplePriceModel>).failure;
    expect(failure, isA<ServerFailure>());
  });
}
