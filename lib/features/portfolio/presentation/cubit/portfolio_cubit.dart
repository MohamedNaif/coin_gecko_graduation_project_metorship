import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/repository/portfolio_repository.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit({required this.repository}) : super(PortfolioInitial());

  final PortfolioRepository repository;

  void getSimplePrice({
    required String ids,
    required String vsCurrencies,
    bool includeChange = true,
  }) async {
    //Prevent multiple requests
    if (state is LoadingGetHoldings) return;
    emit(LoadingGetHoldings());

    //if the cubit is closed, return
    if (isClosed) return;
    final response = await repository.getSimplePrice(
        ids: ids, vsCurrencies: vsCurrencies, includeChange: includeChange);
    response.fold((error) => emit(ErrorGetHoldings(message: error.errMessage)),
        (success) {
      emit(SuccessGetHoldings(simplePriceModel: success));
    });
  }

  void getSimplePriceWithDefaultValues() {
    /// Hardcoded intentionally as these values will never change
    getSimplePrice(
        ids: 'bitcoin,ethereum,ripple',
        vsCurrencies: 'usd',
        includeChange: true);
  }
}
