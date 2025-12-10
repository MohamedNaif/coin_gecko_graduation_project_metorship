import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class CoinModel {
  final String id;
  final String name;
  final String symbol;

  @JsonKey(name: 'image')
  final String imageUrl;

  @JsonKey(name: 'current_price')
  final double currentPrice;

  @JsonKey(name: 'price_change_percentage_24h')
  final double priceChangePercent24h;

  @JsonKey(name: 'market_cap_rank')
  final int marketCapRank;

  const CoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.currentPrice,
    required this.priceChangePercent24h,
    required this.marketCapRank,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinModelToJson(this);
}
