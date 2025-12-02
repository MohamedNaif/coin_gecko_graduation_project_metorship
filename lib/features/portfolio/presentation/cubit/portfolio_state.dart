import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/simple_price_model.dart';

enum States { initial, loading, success, failure }

class PortfolioState {
  final States state;
  final SimplePriceModel? simplePriceModel;
  final String? errorMessage;

  PortfolioState({
    required this.state,
    this.simplePriceModel,
    this.errorMessage,
  });

  PortfolioState copyWith({
    States? state,
    SimplePriceModel? simplePriceModel,
    String? errorMessaga,
  }) {
    return PortfolioState(
      state: state ?? this.state,
      simplePriceModel: simplePriceModel ?? this.simplePriceModel,
      errorMessage: errorMessaga ?? this.errorMessage,
    );
  }
}
