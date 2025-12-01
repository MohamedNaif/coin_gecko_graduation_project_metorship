import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/repository/portfolio_repository.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit({required this.repository})
      : super(PortfolioState(state: State.initial));

  final PortfolioRepository repository;

  void getSimplePrice({
    required String id,
    required String vsCurrencies,
    bool includeChange = false,
  }) async {
    emit(PortfolioState(state: State.loading));
    final response = await repository.getSimplePrice(
        id: id, vsCurrencies: vsCurrencies, includeChange: includeChange);
    response.fold((error) => emit(PortfolioState(state: State.failure)),
        (success) {
      emit(PortfolioState(state: State.success));
    });
  }
}
