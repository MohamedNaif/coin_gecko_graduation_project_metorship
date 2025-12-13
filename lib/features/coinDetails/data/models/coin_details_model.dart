import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_details_model.g.dart';

@JsonSerializable()
class CoinDetailsModel {
  final String id;
  final String name;
  final String symbol;

  @JsonKey(readValue: _readCurrentPrice)
  final double? currentPrice;

  @JsonKey(readValue: _readPriceChange)
  final double priceChange24h;

  @JsonKey(readValue: _readMarketCap)
  final double marketCap;

  @JsonKey(readValue: _readVolume)
  final double volume24h;

  @JsonKey(readValue: _readCirculatingSupply)
  final double circulatingSupply;

  @JsonKey(readValue: _readMaxSupply)
  final double maxSupply;

  @JsonKey(readValue: _readDescription)
  final String description;

  CoinDetailsModel({
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

  factory CoinDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailsModelFromJson(json);

  // --------- Custom JSON extractors ----------
  static Object? _readCurrentPrice(Map map, String key) =>
      map['market_data']?['current_price']?['usd'];

  static Object? _readPriceChange(Map map, String key) =>
      map['market_data']?['price_change_percentage_24h'] ?? 0.0;

  static Object? _readMarketCap(Map map, String key) =>
      map['market_data']?['market_cap']?['usd'] ?? 0.0;

  static Object? _readVolume(Map map, String key) =>
      map['market_data']?['total_volume']?['usd'] ?? 0.0;

  static Object? _readCirculatingSupply(Map map, String key) =>
      map['market_data']?['circulating_supply'] ?? 0.0;

  static Object? _readMaxSupply(Map map, String key) =>
      map['market_data']?['max_supply'] ?? 0.0;

  static Object? _readDescription(Map map, String key) =>
      map['description']?['en'] ?? '';
}