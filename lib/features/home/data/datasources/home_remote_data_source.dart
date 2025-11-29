import 'package:coin_gecko_graduation_project_metorship/core/api/api_services.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/trending_coin_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSource(this._apiService);

  Future<GlobalDataModel> getGlobalData() async {
    return await _apiService.getGlobalData();
  }

  Future<TrendingData> getTrendingCoins() async {
    return await _apiService.getTrendingCoins();
  }

  Future<List<MarketCoinModel>> getMarkets({
    String vsCurrency = 'usd',
    String order = 'market_cap_desc',
    int perPage = 20,
    int page = 1,
    bool sparkline = false,
  }) async {
    return await _apiService.getMarkets(
      vsCurrency,
      order,
      perPage,
      page,
      sparkline,
    );
  }
}
