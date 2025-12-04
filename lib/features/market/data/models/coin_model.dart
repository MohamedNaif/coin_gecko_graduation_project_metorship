class CoinModel {
  final String id;
  final String name;
  final String symbol;
  final String imageUrl;
  final double currentPrice;
  final double priceChangePercent24h;
  final int marketCapRank;


  CoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.currentPrice,
    required this.priceChangePercent24h,
    required this.marketCapRank,

});

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      currentPrice: double.tryParse(json['current_price'].toString()) ?? 0.0,
      priceChangePercent24h:
      double.tryParse(json['price_change_percentage_24h'].toString()) ??
          0.0,
      marketCapRank: json['market_cap_rank'] ?? 0,
    );
  }
}
