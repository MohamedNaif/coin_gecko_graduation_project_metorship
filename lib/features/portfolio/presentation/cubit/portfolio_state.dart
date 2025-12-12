import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/simple_price_model.dart';

sealed class PortfolioState {
  const PortfolioState();
}

final class PortfolioInitial extends PortfolioState {}

final class LoadingGetHoldings extends PortfolioState {
  const LoadingGetHoldings();
}

final class SuccessGetHoldings extends PortfolioState {
  final SimplePriceModel simplePriceModel;
  const SuccessGetHoldings({required this.simplePriceModel});
}

final class ErrorGetHoldings extends PortfolioState {
  final String message;
  const ErrorGetHoldings({required this.message});
}
