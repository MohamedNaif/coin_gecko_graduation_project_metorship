import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/simple_price_model.dart';

enum State { initial, loading, success, failure }

class PortfolioState {
  final State state;
  final SimplePriceModel? simplePriceModel;
  final String? errorMessaga;

  PortfolioState({
    required this.state,
    this.simplePriceModel,
    this.errorMessaga,
  });

  PortfolioState copyWith({
    State? state,
    SimplePriceModel? simplePriceModel,
    String? errorMessaga,
  }) {
    return PortfolioState(
      state: state ?? this.state,
      simplePriceModel: simplePriceModel ?? this.simplePriceModel,
      errorMessaga: errorMessaga ?? this.errorMessaga,
    );
  }
}
