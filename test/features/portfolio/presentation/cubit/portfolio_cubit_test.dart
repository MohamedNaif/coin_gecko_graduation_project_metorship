import 'package:bloc_test/bloc_test.dart';
import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/model/simple_price_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/repository/portfolio_repository.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'portfolio_cubit_test.mocks.dart';

@GenerateMocks([PortfolioRepository])
void main() {
  late PortfolioCubit mockPortfolioCubit;
  late PortfolioRepository mockPortfolioRepository;

  setUpAll(() {
    provideDummy<Result<SimplePriceModel>>(
      Success(SimplePriceModel(coins: [])),
    );
  });

  setUp(() {
    mockPortfolioRepository = MockPortfolioRepository();
    mockPortfolioCubit = PortfolioCubit(repository: mockPortfolioRepository);
  });

  group('PortfolioCubit', () {
    blocTest(
        'when getSimplePrice is called in success state must emit loading state then success state',
        build: () => mockPortfolioCubit,
        setUp: () => when(mockPortfolioRepository.getSimplePrice(
                ids: 'bitcoin', vsCurrencies: 'usd', includeChange: true))
            .thenAnswer((_) async => Success(SimplePriceModel(coins: []))),
        act: (cubit) => cubit.getSimplePrice(
            ids: 'bitcoin', vsCurrencies: 'usd', includeChange: true),
        expect: () => [isA<LoadingGetHoldings>(), isA<SuccessGetHoldings>()]);
    blocTest(
        'When getSimplePrice is called in error state must emit loading state then error state',
        build: () => mockPortfolioCubit,
        setUp: () => when(mockPortfolioRepository.getSimplePrice(
                ids: 'bitcoin', vsCurrencies: 'usd', includeChange: true))
            .thenAnswer(
                (_) async => FailureResult(ServerFailure(errMessage: 'error'))),
        act: (cubit) => cubit.getSimplePrice(
            ids: 'bitcoin', vsCurrencies: 'usd', includeChange: true),
        expect: () => [isA<LoadingGetHoldings>(), isA<ErrorGetHoldings>()]);
  });
}
