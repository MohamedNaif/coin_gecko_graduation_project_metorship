import 'package:bloc_test/bloc_test.dart';
import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/trending_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/repos/home_repo.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main() {
  late HomeCubit cubit;
  late MockHomeRepo mockRepo;

  setUp(() {
    mockRepo = MockHomeRepo();

    // Provide dummy values for Mockito
    provideDummy<Result<GlobalDataModel>>(Success(GlobalDataModel()));
    provideDummy<Result<TrendingData>>(Success(TrendingData()));
    provideDummy<Result<List<MarketCoinModel>>>(Success([]));

    cubit = HomeCubit(mockRepo);
  });

  tearDown(() {
    cubit.close();
  });

  group('getGlobalData', () {
    final tGlobalDataModel = GlobalDataModel(
      activeCryptocurrencies: 10000,
      markets: 500,
      totalMarketCap: {'usd': 1000000000.0},
      totalVolume: {'usd': 50000000.0},
      marketCapPercentage: {'btc': 45.5},
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, success] when getGlobalData is successful',
      build: () {
        when(
          mockRepo.getGlobalData(),
        ).thenAnswer((_) async => Success(tGlobalDataModel));
        return cubit;
      },
      act: (cubit) => cubit.getGlobalData(),
      expect: () => [
        const HomeState(globalDataStatus: HomeDataStatus.loading),
        HomeState(
          globalDataStatus: HomeDataStatus.success,
          globalData: tGlobalDataModel,
        ),
      ],
      verify: (_) {
        verify(mockRepo.getGlobalData()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, failure] when getGlobalData fails',
      build: () {
        when(mockRepo.getGlobalData()).thenAnswer(
          (_) async => FailureResult(ServerFailure(errMessage: 'Server error')),
        );
        return cubit;
      },
      act: (cubit) => cubit.getGlobalData(),
      expect: () => [
        const HomeState(globalDataStatus: HomeDataStatus.loading),
        const HomeState(
          globalDataStatus: HomeDataStatus.failure,
          errorMessage: 'Server error',
        ),
      ],
    );
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

    blocTest<HomeCubit, HomeState>(
      'emits [loading, success] when getTrendingCoins is successful',
      build: () {
        when(
          mockRepo.getTrendingCoins(),
        ).thenAnswer((_) async => Success(tTrendingData));
        return cubit;
      },
      act: (cubit) => cubit.getTrendingCoins(),
      expect: () => [
        const HomeState(trendingDataStatus: HomeDataStatus.loading),
        HomeState(
          trendingDataStatus: HomeDataStatus.success,
          trendingData: tTrendingData,
        ),
      ],
      verify: (_) {
        verify(mockRepo.getTrendingCoins()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, failure] when getTrendingCoins fails',
      build: () {
        when(mockRepo.getTrendingCoins()).thenAnswer(
          (_) async =>
              FailureResult(ServerFailure(errMessage: 'Network error')),
        );
        return cubit;
      },
      act: (cubit) => cubit.getTrendingCoins(),
      expect: () => [
        const HomeState(trendingDataStatus: HomeDataStatus.loading),
        const HomeState(
          trendingDataStatus: HomeDataStatus.failure,
          errorMessage: 'Network error',
        ),
      ],
    );
  });

  group('getMarkets', () {
    // Create 20 items to test pagination properly
    final tMarketCoins = List.generate(
      20,
      (index) => MarketCoinModel(
        id: 'coin_$index',
        name: 'Coin $index',
        symbol: 'c$index',
        image: 'https://example.com/coin_$index.png',
        currentPrice: 1000.0 + index,
        priceChangePercentage24h: 1.0 + index,
      ),
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, success] when getMarkets is successful',
      build: () {
        when(
          mockRepo.getMarkets(
            vsCurrency: anyNamed('vsCurrency'),
            order: anyNamed('order'),
            perPage: anyNamed('perPage'),
            page: anyNamed('page'),
            sparkline: anyNamed('sparkline'),
          ),
        ).thenAnswer((_) async => Success(tMarketCoins));
        return cubit;
      },
      act: (cubit) => cubit.getMarkets(),
      expect: () => [
        const HomeState(marketDataStatus: HomeDataStatus.loading),
        HomeState(
          marketDataStatus: HomeDataStatus.success,
          marketData: tMarketCoins,
          hasMoreMarkets: true,
          marketPage: 1,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, failure] when getMarkets fails',
      build: () {
        when(
          mockRepo.getMarkets(
            vsCurrency: anyNamed('vsCurrency'),
            order: anyNamed('order'),
            perPage: anyNamed('perPage'),
            page: anyNamed('page'),
            sparkline: anyNamed('sparkline'),
          ),
        ).thenAnswer(
          (_) async => FailureResult(
            ServerFailure(errMessage: 'Failed to load markets'),
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.getMarkets(),
      expect: () => [
        const HomeState(marketDataStatus: HomeDataStatus.loading),
        const HomeState(
          marketDataStatus: HomeDataStatus.failure,
          errorMessage: 'Failed to load markets',
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'should load more markets when loadMore is true',
      build: () {
        when(
          mockRepo.getMarkets(
            vsCurrency: anyNamed('vsCurrency'),
            order: anyNamed('order'),
            perPage: anyNamed('perPage'),
            page: anyNamed('page'),
            sparkline: anyNamed('sparkline'),
          ),
        ).thenAnswer((_) async => Success(tMarketCoins));
        return cubit;
      },
      seed: () => HomeState(
        marketData: List.generate(
          20,
          (index) => MarketCoinModel(
            id: 'existing_$index',
            name: 'Existing $index',
            symbol: 'e$index',
            image: 'https://example.com/existing_$index.png',
            currentPrice: 500.0 + index,
            priceChangePercentage24h: 0.5 + index,
          ),
        ),
        marketPage: 1,
        hasMoreMarkets: true,
      ),
      act: (cubit) => cubit.getMarkets(loadMore: true),
      skip: 1, // Skip state comparison due to list equality issues
      verify: (_) {
        verify(
          mockRepo.getMarkets(
            vsCurrency: anyNamed('vsCurrency'),
            order: anyNamed('order'),
            perPage: 20,
            page: 2,
            sparkline: anyNamed('sparkline'),
          ),
        ).called(1);
        // Verify the state manually
        expect(cubit.state.marketPage, 2);
        expect(cubit.state.marketData.length, 40);
        expect(cubit.state.hasMoreMarkets, true);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'should not load more when hasMoreMarkets is false',
      build: () => cubit,
      seed: () => const HomeState(marketData: [], hasMoreMarkets: false),
      act: (cubit) => cubit.getMarkets(loadMore: true),
      expect: () => [],
      verify: (_) {
        verifyNever(
          mockRepo.getMarkets(
            vsCurrency: anyNamed('vsCurrency'),
            order: anyNamed('order'),
            perPage: anyNamed('perPage'),
            page: anyNamed('page'),
            sparkline: anyNamed('sparkline'),
          ),
        );
      },
    );

    blocTest<HomeCubit, HomeState>(
      'should not load more when already loading',
      build: () => cubit,
      seed: () => const HomeState(
        marketDataStatus: HomeDataStatus.loading,
        hasMoreMarkets: true,
      ),
      act: (cubit) => cubit.getMarkets(loadMore: true),
      expect: () => [],
    );

    blocTest<HomeCubit, HomeState>(
      'should set hasMoreMarkets to false when less than 20 items returned',
      build: () {
        when(
          mockRepo.getMarkets(
            vsCurrency: anyNamed('vsCurrency'),
            order: anyNamed('order'),
            perPage: anyNamed('perPage'),
            page: anyNamed('page'),
            sparkline: anyNamed('sparkline'),
          ),
        ).thenAnswer((_) async => Success([tMarketCoins.first]));
        return cubit;
      },
      act: (cubit) => cubit.getMarkets(),
      expect: () => [
        const HomeState(marketDataStatus: HomeDataStatus.loading),
        HomeState(
          marketDataStatus: HomeDataStatus.success,
          marketData: [tMarketCoins.first],
          hasMoreMarkets: false,
          marketPage: 1,
        ),
      ],
    );
  });

  group('getAllData', () {
    final tGlobalDataModel = GlobalDataModel(
      activeCryptocurrencies: 10000,
      markets: 500,
      totalMarketCap: {'usd': 1000000000.0},
      totalVolume: {'usd': 50000000.0},
      marketCapPercentage: {'btc': 45.5},
    );

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

    final tMarketCoins = [
      MarketCoinModel(
        id: 'bitcoin',
        name: 'Bitcoin',
        symbol: 'btc',
        image: 'https://example.com/btc.png',
        currentPrice: 50000.0,
        priceChangePercentage24h: 5.0,
      ),
    ];

    blocTest<HomeCubit, HomeState>(
      'should call all three methods when getAllData is called',
      build: () {
        when(
          mockRepo.getGlobalData(),
        ).thenAnswer((_) async => Success(tGlobalDataModel));
        when(
          mockRepo.getTrendingCoins(),
        ).thenAnswer((_) async => Success(tTrendingData));
        when(
          mockRepo.getMarkets(
            vsCurrency: anyNamed('vsCurrency'),
            order: anyNamed('order'),
            perPage: anyNamed('perPage'),
            page: anyNamed('page'),
            sparkline: anyNamed('sparkline'),
          ),
        ).thenAnswer((_) async => Success(tMarketCoins));
        return cubit;
      },
      act: (cubit) => cubit.getAllData(),
      skip: 3, // Skip state emissions, we only care about method calls
      verify: (_) {
        verify(mockRepo.getGlobalData()).called(1);
        verify(mockRepo.getTrendingCoins()).called(1);
        verify(
          mockRepo.getMarkets(
            vsCurrency: anyNamed('vsCurrency'),
            order: anyNamed('order'),
            perPage: anyNamed('perPage'),
            page: anyNamed('page'),
            sparkline: anyNamed('sparkline'),
          ),
        ).called(1);
      },
    );
  });
}
