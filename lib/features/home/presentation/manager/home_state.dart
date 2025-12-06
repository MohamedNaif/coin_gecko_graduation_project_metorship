import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/trending_coin_model.dart';

enum HomeDataStatus { initial, loading, success, failure }

class HomeState {
  final HomeDataStatus globalDataStatus;
  final HomeDataStatus trendingDataStatus;
  final HomeDataStatus marketDataStatus;

  final GlobalDataModel? globalData;
  final TrendingData? trendingData;
  final List<MarketCoinModel> marketData;

  final String? errorMessage;
  final bool hasMoreMarkets;
  final int marketPage;

  const HomeState({
    this.globalDataStatus = HomeDataStatus.initial,
    this.trendingDataStatus = HomeDataStatus.initial,
    this.marketDataStatus = HomeDataStatus.initial,
    this.globalData,
    this.trendingData,
    this.marketData = const [],
    this.errorMessage,
    this.hasMoreMarkets = true,
    this.marketPage = 1,
  });

  HomeState copyWith({
    HomeDataStatus? globalDataStatus,
    HomeDataStatus? trendingDataStatus,
    HomeDataStatus? marketDataStatus,
    GlobalDataModel? globalData,
    TrendingData? trendingData,
    List<MarketCoinModel>? marketData,
    String? errorMessage,
    bool? hasMoreMarkets,
    int? marketPage,
  }) {
    return HomeState(
      globalDataStatus: globalDataStatus ?? this.globalDataStatus,
      trendingDataStatus: trendingDataStatus ?? this.trendingDataStatus,
      marketDataStatus: marketDataStatus ?? this.marketDataStatus,
      globalData: globalData ?? this.globalData,
      trendingData: trendingData ?? this.trendingData,
      marketData: marketData ?? this.marketData,
      errorMessage: errorMessage ?? this.errorMessage,
      hasMoreMarkets: hasMoreMarkets ?? this.hasMoreMarkets,
      marketPage: marketPage ?? this.marketPage,
    );
  }
}
