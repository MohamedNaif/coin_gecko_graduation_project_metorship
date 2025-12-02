import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/repository/portfolio_repository.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit({required this.repository})
      : super(PortfolioState(state: States.loading));

  final PortfolioRepository repository;

  void getSimplePrice({
    String id = 'bitcoin,ethereum,solana',
    String vsCurrencies = 'usd',
    bool includeChange = false,
  }) async {
    emit(PortfolioState(state: States.loading));
    final response = await repository.getSimplePrice(
        id: id, vsCurrencies: vsCurrencies, includeChange: includeChange);
    response.fold(
        (error) => emit(PortfolioState(
            state: States.failure, errorMessaga: error.errMessage)), (success) {
      emit(PortfolioState(state: States.success, simplePriceModel: success));
    });
  }
}
