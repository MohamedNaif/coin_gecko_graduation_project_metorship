import 'package:injectable/injectable.dart';
import '../../../../core/api/api_constant.dart';
import '../data_source/market_remote_data_source.dart';
import '../models/coin_model.dart';
import '../models/search_coin_model.dart';
import '../models/search_response.dart';

@lazySingleton
class MarketRepository {
  final MarketRemoteDataSource remoteDataSource;

  MarketRepository(this.remoteDataSource);

  Future<List<CoinModel>> fetchMarketCoins({
    required int page,
    int perPage = ApiConstant.defaultPerPage,
  }) {
    return remoteDataSource.getMarketCoins(
      ApiConstant.usd,
      ApiConstant.defaultOrder,
      perPage,
      page,
    );
  }

  Future<List<SearchCoinModel>> searchCoins(String query) async {
    if (query.isEmpty) return [];

    final SearchResponse response = await remoteDataSource.searchCoins(query);
    return response.coins;
  }
}
