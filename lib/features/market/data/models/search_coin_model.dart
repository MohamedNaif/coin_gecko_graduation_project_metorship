import 'package:json_annotation/json_annotation.dart';

part 'search_coin_model.g.dart';

@JsonSerializable()
class SearchCoinModel {
  final String id;
  final String name;
  final String symbol;
  final String thumb;

  @JsonKey(name: 'market_cap_rank')
  final int marketCapRank;

  const SearchCoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.thumb,
    required this.marketCapRank,
  });

  factory SearchCoinModel.fromJson(Map<String, dynamic> json) =>
      _$SearchCoinModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCoinModelToJson(this);
}
