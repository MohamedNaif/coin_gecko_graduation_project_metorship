import 'package:json_annotation/json_annotation.dart';

part 'trending_coin_model.g.dart';

@JsonSerializable()
class TrendingData {
  final List<TrendingCoinModel>? coins;

  TrendingData({this.coins});

  factory TrendingData.fromJson(Map<String, dynamic> json) =>
      _$TrendingDataFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingDataToJson(this);
}

@JsonSerializable()
class TrendingCoinModel {
  @JsonKey(readValue: _readId)
  final String? id;
  @JsonKey(readValue: _readName)
  final String? name;
  @JsonKey(readValue: _readSymbol)
  final String? symbol;
  @JsonKey(readValue: _readThumb)
  final String? thumb;
  @JsonKey(readValue: _readPrice)
  final double? price;
  @JsonKey(name: 'price_change_percentage_24h', readValue: _readPriceChange)
  final double? priceChangePercentage24h;
  @JsonKey(readValue: _readSparkline)
  final String? sparkline;

  TrendingCoinModel({
    this.id,
    this.name,
    this.symbol,
    this.thumb,
    this.price,
    this.priceChangePercentage24h,
    this.sparkline,
  });

  factory TrendingCoinModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingCoinModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingCoinModelToJson(this);

  static Object? _readId(Map map, String key) => map['item']['id'];
  static Object? _readName(Map map, String key) => map['item']['name'];
  static Object? _readSymbol(Map map, String key) => map['item']['symbol'];
  static Object? _readThumb(Map map, String key) => map['item']['thumb'];
  static Object? _readPrice(Map map, String key) =>
      map['item']['data']['price'];
  static Object? _readPriceChange(Map map, String key) =>
      map['item']['data']['price_change_percentage_24h']['usd'];
  static Object? _readSparkline(Map map, String key) =>
      map['item']['data']['sparkline'];
}
