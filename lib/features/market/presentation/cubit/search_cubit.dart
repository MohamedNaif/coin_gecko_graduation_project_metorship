import 'dart:async';
import 'package:coin_gecko_graduation_project_metorship/features/market/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/market_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  final MarketRepository repo;
  Timer? _debounce;

  SearchCubit(this.repo) : super(SearchInitial());

  void search(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        emit(SearchInitial());
        return;
      }

      emit(SearchLoading());

      try {
        final result =await repo.searchCoins(query);
        emit(SearchResults(result));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
