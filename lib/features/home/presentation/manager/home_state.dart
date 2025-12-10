import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/trending_coin_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

enum HomeDataStatus { initial, loading, success, failure }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeDataStatus.initial) HomeDataStatus globalDataStatus,
    @Default(HomeDataStatus.initial) HomeDataStatus trendingDataStatus,
    @Default(HomeDataStatus.initial) HomeDataStatus marketDataStatus,
    GlobalDataModel? globalData,
    TrendingData? trendingData,
    @Default([]) List<MarketCoinModel> marketData,
    String? errorMessage,
    @Default(true) bool hasMoreMarkets,
    @Default(1) int marketPage,
  }) = _HomeState;
}
