class TrendingData {
  final List<TrendingCoinModel> coins;

  TrendingData({required this.coins});

  factory TrendingData.fromJson(Map<String, dynamic> json) {
    return TrendingData(
      coins: (json['coins'] as List)
          .map((e) => TrendingCoinModel.fromJson(e))
          .toList(),
    );
  }
}

class TrendingCoinModel {
  final String id;
  final String name;
  final String symbol;
  final String thumb;
  final double price;
  final double priceChangePercentage24h;
  final String sparkline;

  TrendingCoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.thumb,
    required this.price,
    required this.priceChangePercentage24h,
    required this.sparkline,
  });

  factory TrendingCoinModel.fromJson(Map<String, dynamic> json) {
    final item = json['item'];
    final data = item['data'];
    return TrendingCoinModel(
      id: item['id'] ?? '',
      name: item['name'] ?? '',
      symbol: item['symbol'] ?? '',
      thumb: item['thumb'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      priceChangePercentage24h:
          (data['price_change_percentage_24h']['usd'] ?? 0).toDouble(),
      sparkline: data['sparkline'] ?? '',
    );
  }
}
