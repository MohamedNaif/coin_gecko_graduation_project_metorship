
import 'search_coin_model.dart';

class SearchResponse {
  final List<SearchCoinModel> coins;

  SearchResponse({required this.coins});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    final list = json['coins'] as List? ?? [];
    return SearchResponse(
      coins: list.map((item) => SearchCoinModel.fromJson(item)).toList(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "coins": coins.map((c) => c.toJson()).toList(),
    };
  }
}
