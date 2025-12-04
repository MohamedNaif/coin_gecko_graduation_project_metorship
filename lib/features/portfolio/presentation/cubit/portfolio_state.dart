import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/simple_price_model.dart';

sealed class PortfolioState {}

final class PortfolioInitial extends PortfolioState {}

final class LoadingGetHoldings extends PortfolioState {}

final class SuccessGetHoldings extends PortfolioState {
  final SimplePriceModel simplePriceModel;
  SuccessGetHoldings({required this.simplePriceModel});
}

final class ErrorGetHoldings extends PortfolioState {
  final String message;
  ErrorGetHoldings({required this.message});
}
