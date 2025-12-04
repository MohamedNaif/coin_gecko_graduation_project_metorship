import '../../data/models/coin_model.dart';

abstract class MarketState {}

class MarketInitial extends MarketState {}

class MarketLoading extends MarketState {}

class MarketLoaded extends MarketState {
  final List<CoinModel> coins;
  final bool hasReachedEnd;
  final int page;

  MarketLoaded({
    required this.coins,
    required this.hasReachedEnd,
    required this.page,
  });
}

class MarketError extends MarketState {
  final String message;
  MarketError(this.message);
}
