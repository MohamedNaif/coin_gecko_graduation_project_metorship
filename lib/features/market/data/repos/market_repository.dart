
import '../../../../core/api/api_services.dart';
import '../models/coin_model.dart';
import '../models/search_coin_model.dart';

class MarketRepository {
  final ApiService api;

  MarketRepository({required this.api});

  Future<List<CoinModel>> fetchMarketCoins({
    required int page,
    int perPage = 50,
  }) {
    return api.getMarketCoins("usd", "market_cap_desc", perPage, page);
  }

  Future<List<SearchCoinModel>> searchCoins(String query) async {
    if (query.isEmpty) return [];

    final response = await api.searchCoins(query);

    return response.coins;
  }

}
