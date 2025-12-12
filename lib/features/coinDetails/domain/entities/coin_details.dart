class CoinDetails {
  final String id;
  final String name;
  final String symbol;
  final double currentPrice;
  final double priceChange24h;
  final double marketCap;
  final double volume24h;
  final double circulatingSupply;
  final double maxSupply;
  final String description;

  CoinDetails({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.priceChange24h,
    required this.marketCap,
    required this.volume24h,
    required this.circulatingSupply,
    required this.maxSupply,
    required this.description,
  });
}