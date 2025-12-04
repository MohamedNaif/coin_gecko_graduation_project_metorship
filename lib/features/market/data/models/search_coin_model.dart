class SearchCoinModel {
  final String id;
  final String name;
  final String symbol;
  final String thumb;
  final int marketCapRank;

  SearchCoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.thumb,
    required this.marketCapRank,
  });

  factory SearchCoinModel.fromJson(Map<String, dynamic> json) {
    return SearchCoinModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      symbol: json["symbol"] ?? "",
      thumb: json["thumb"] ?? "",
      marketCapRank: json["market_cap_rank"] ?? 0,

    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "symbol": symbol,
      "thumb": thumb,
      "market_cap_rank": marketCapRank,
    };
  }

}
