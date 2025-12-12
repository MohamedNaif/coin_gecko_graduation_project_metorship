import 'package:json_annotation/json_annotation.dart';
import 'search_coin_model.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  final List<SearchCoinModel> coins;

  const SearchResponse({
    required this.coins,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
