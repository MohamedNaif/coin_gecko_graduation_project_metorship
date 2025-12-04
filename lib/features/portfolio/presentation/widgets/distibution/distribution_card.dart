import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/distibution/states/card_distibution_success_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DistributionCard extends StatelessWidget {
  const DistributionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioCubit, PortfolioState>(
      buildWhen: (previous, current) {
        return current is SuccessGetHoldings || current is ErrorGetHoldings;
      },
      builder: (context, state) {
        switch (state) {
          case LoadingGetHoldings _:
            return const Center(child: CircularProgressIndicator());
          case SuccessGetHoldings _:
            return DistributionCardSuccessState(
                coins: state.simplePriceModel.coins ?? []);
          case ErrorGetHoldings _:
            return _buildErrorWidget(state.message, context);
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _buildErrorWidget(String? errorMessage, BuildContext context) {
    return Center(
      child: Text(
        errorMessage ?? AppStrings.errorMessage,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.theme.colorScheme.error,
        ),
      ),
    );
  }
}
