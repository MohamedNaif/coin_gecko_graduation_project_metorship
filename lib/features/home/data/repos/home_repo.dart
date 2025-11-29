import 'package:coin_gecko_graduation_project_metorship/features/home/data/datasources/home_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/global_data_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/market_coin_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/data/models/trending_coin_model.dart';

import 'package:injectable/injectable.dart';

@injectable
class HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepo(this._homeRemoteDataSource);

  Future<GlobalDataModel> getGlobalData() async {
    return await _homeRemoteDataSource.getGlobalData();
  }

  Future<TrendingData> getTrendingCoins() async {
    return await _homeRemoteDataSource.getTrendingCoins();
  }

  Future<List<MarketCoinModel>> getMarkets({
    String vsCurrency = 'usd',
    String order = 'market_cap_desc',
    int perPage = 20,
    int page = 1,
    bool sparkline = false,
  }) async {
    return await _homeRemoteDataSource.getMarkets(
      vsCurrency: vsCurrency,
      order: order,
      perPage: perPage,
      page: page,
      sparkline: sparkline,
    );
  }
}
