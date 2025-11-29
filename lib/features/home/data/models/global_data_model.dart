class GlobalDataModel {
  final int activeCryptocurrencies;
  final int markets;
  final double totalMarketCap;
  final double totalVolume;
  final double btcDominance;

  GlobalDataModel({
    required this.activeCryptocurrencies,
    required this.markets,
    required this.totalMarketCap,
    required this.totalVolume,
    required this.btcDominance,
  });

  factory GlobalDataModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return GlobalDataModel(
      activeCryptocurrencies: data['active_cryptocurrencies'] ?? 0,
      markets: data['markets'] ?? 0,
      totalMarketCap: (data['total_market_cap']['usd'] ?? 0).toDouble(),
      totalVolume: (data['total_volume']['usd'] ?? 0).toDouble(),
      btcDominance: (data['market_cap_percentage']['btc'] ?? 0).toDouble(),
    );
  }
}
