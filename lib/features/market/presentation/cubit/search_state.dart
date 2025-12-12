
import '../../data/models/search_coin_model.dart';


abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchResults extends SearchState {
  final List<SearchCoinModel> results;
  SearchResults(this.results);
}

class SearchError extends SearchState {
  final String error;
  SearchError(this.error);
}

