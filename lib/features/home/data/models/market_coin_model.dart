import 'package:json_annotation/json_annotation.dart';

part 'market_coin_model.g.dart';

@JsonSerializable()
class MarketCoinModel {
  final String? id;
  final String? name;
  final String? symbol;
  final String? image;
  @JsonKey(name: 'current_price')
  final double? currentPrice;
  @JsonKey(name: 'price_change_percentage_24h')
  final double? priceChangePercentage24h;

  MarketCoinModel({
    this.id,
    this.name,
    this.symbol,
    this.image,
    this.currentPrice,
    this.priceChangePercentage24h,
  });

  factory MarketCoinModel.fromJson(Map<String, dynamic> json) =>
      _$MarketCoinModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketCoinModelToJson(this);
}
