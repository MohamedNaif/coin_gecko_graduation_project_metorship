import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/datasources/home_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/trending_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repo_test.mocks.dart';

@GenerateMocks([HomeRemoteDataSource])
void main() {
  late HomeRepo repository;
  late MockHomeRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockHomeRemoteDataSource();
    repository = HomeRepo(mockDataSource);
  });

  group('getGlobalData', () {
    final tGlobalDataModel = GlobalDataModel(
      activeCryptocurrencies: 10000,
      markets: 500,
      totalMarketCap: {'usd': 1000000000.0},
      totalVolume: {'usd': 50000000.0},
      marketCapPercentage: {'btc': 45.5},
    );

    final tGlobalDataResponse = GlobalDataResponse(data: tGlobalDataModel);

    test(
      'should return Success with GlobalDataModel when call is successful',
      () async {
        // Arrange
        when(
          mockDataSource.getGlobalData(),
        ).thenAnswer((_) async => tGlobalDataResponse);

        // Act
        final result = await repository.getGlobalData();

        // Assert
        expect(result, isA<Success<GlobalDataModel>>());
        result.fold((failure) => fail('Should not return failure'), (data) {
          expect(data.activeCryptocurrencies, 10000);
          expect(data.markets, 500);
        });
        verify(mockDataSource.getGlobalData()).called(1);
      },
    );

    test('should return FailureResult when DioException occurs', () async {
      // Arrange
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/global'),
        response: Response(
          requestOptions: RequestOptions(path: '/global'),
          statusCode: 500,
          statusMessage: 'Server Error',
        ),
      );

      when(mockDataSource.getGlobalData()).thenThrow(dioException);

      // Act
      final result = await repository.getGlobalData();

      // Assert
      expect(result, isA<FailureResult<GlobalDataModel>>());
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (data) => fail('Should not return success'),
      );
      verify(mockDataSource.getGlobalData()).called(1);
    });

    test('should return FailureResult when generic exception occurs', () async {
      // Arrange
      when(
        mockDataSource.getGlobalData(),
      ).thenThrow(Exception('Something went wrong'));

      // Act
      final result = await repository.getGlobalData();

      // Assert
      expect(result, isA<FailureResult<GlobalDataModel>>());
      result.fold((failure) {
        expect(failure, isA<ServerFailure>());
        expect(failure.errMessage, contains('Exception: Something went wrong'));
      }, (data) => fail('Should not return success'));
    });
  });

  group('getTrendingCoins', () {
    final tTrendingData = TrendingData(
      coins: [
        TrendingCoinModel(
          id: 'bitcoin',
          name: 'Bitcoin',
          symbol: 'BTC',
          thumb: 'https://example.com/btc.png',
          price: 50000.0,
          priceChangePercentage24h: 5.0,
          sparkline: 'sparkline_url',
        ),
      ],
    );

    test(
      'should return Success with TrendingData when call is successful',
      () async {
        // Arrange
        when(
          mockDataSource.getTrendingCoins(),
        ).thenAnswer((_) async => tTrendingData);

        // Act
        final result = await repository.getTrendingCoins();

        // Assert
        expect(result, isA<Success<TrendingData>>());
        result.fold((failure) => fail('Should not return failure'), (data) {
          expect(data.coins?.length, 1);
          expect(data.coins?.first.name, 'Bitcoin');
        });
        verify(mockDataSource.getTrendingCoins()).called(1);
      },
    );

    test('should return FailureResult when DioException occurs', () async {
      // Arrange
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/trending'),
        type: DioExceptionType.connectionTimeout,
      );

      when(mockDataSource.getTrendingCoins()).thenThrow(dioException);

      // Act
      final result = await repository.getTrendingCoins();

      // Assert
      expect(result, isA<FailureResult<TrendingData>>());
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (data) => fail('Should not return success'),
      );
    });
  });

  group('getMarkets', () {
    final tMarketCoins = [
      MarketCoinModel(
        id: 'bitcoin',
        name: 'Bitcoin',
        symbol: 'btc',
        image: 'https://example.com/btc.png',
        currentPrice: 50000.0,
        priceChangePercentage24h: 5.0,
      ),
      MarketCoinModel(
        id: 'ethereum',
        name: 'Ethereum',
        symbol: 'eth',
        image: 'https://example.com/eth.png',
        currentPrice: 3000.0,
        priceChangePercentage24h: 3.0,
      ),
    ];

    test(
      'should return Success with List<MarketCoinModel> when call is successful',
      () async {
        // Arrange
        when(
          mockDataSource.getMarkets(
            vsCurrency: anyNamed('vsCurrency'),
            order: anyNamed('order'),
            perPage: anyNamed('perPage'),
            page: anyNamed('page'),
            sparkline: anyNamed('sparkline'),
          ),
        ).thenAnswer((_) async => tMarketCoins);

        // Act
        final result = await repository.getMarkets();

        // Assert
        expect(result, isA<Success<List<MarketCoinModel>>>());
        result.fold((failure) => fail('Should not return failure'), (data) {
          expect(data.length, 2);
          expect(data.first.name, 'Bitcoin');
        });
      },
    );

    test('should pass correct parameters to data source', () async {
      // Arrange
      when(
        mockDataSource.getMarkets(
          vsCurrency: anyNamed('vsCurrency'),
          order: anyNamed('order'),
          perPage: anyNamed('perPage'),
          page: anyNamed('page'),
          sparkline: anyNamed('sparkline'),
        ),
      ).thenAnswer((_) async => tMarketCoins);

      // Act
      await repository.getMarkets(
        vsCurrency: 'eur',
        order: 'volume_desc',
        perPage: 50,
        page: 2,
        sparkline: true,
      );

      // Assert
      verify(
        mockDataSource.getMarkets(
          vsCurrency: 'eur',
          order: 'volume_desc',
          perPage: 50,
          page: 2,
          sparkline: true,
        ),
      ).called(1);
    });

    test('should return FailureResult when DioException occurs', () async {
      // Arrange
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/markets'),
        response: Response(
          requestOptions: RequestOptions(path: '/markets'),
          statusCode: 404,
          statusMessage: 'Not Found',
        ),
      );

      when(
        mockDataSource.getMarkets(
          vsCurrency: anyNamed('vsCurrency'),
          order: anyNamed('order'),
          perPage: anyNamed('perPage'),
          page: anyNamed('page'),
          sparkline: anyNamed('sparkline'),
        ),
      ).thenThrow(dioException);

      // Act
      final result = await repository.getMarkets();

      // Assert
      expect(result, isA<FailureResult<List<MarketCoinModel>>>());
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (data) => fail('Should not return success'),
      );
    });
  });
}
