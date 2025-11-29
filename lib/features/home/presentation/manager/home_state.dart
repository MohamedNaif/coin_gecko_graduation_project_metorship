import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/trending_coin_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final GlobalDataModel globalData;
  final TrendingData trendingData;
  final List<MarketCoinModel> marketData;

  HomeSuccess({
    required this.globalData,
    required this.trendingData,
    required this.marketData,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
