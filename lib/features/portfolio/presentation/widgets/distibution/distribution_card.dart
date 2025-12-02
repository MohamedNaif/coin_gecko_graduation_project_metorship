import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/distibution/distribution_details.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/distibution/gradient_ring_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DistributionCard extends StatelessWidget {
  const DistributionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioCubit, PortfolioState>(
      builder: (context, state) {
        switch (state.state) {
          case States.loading:
            return const Center(child: CircularProgressIndicator());
          case States.success:
            return Row(
              children: [
                Expanded(
                    child: GradientRingChart(
                  coins: state.simplePriceModel?.coins ?? [],
                )),
                SizedBox(width: 10),
                Expanded(
                    child: DistributionDetails(
                  coins: state.simplePriceModel?.coins ?? [],
                )),
              ],
            );
          case States.failure:
            return _buildErrorWidget(state.errorMessaga, context);
        }
      },
    );
  }

  Widget _buildErrorWidget(String? errorMessaga, BuildContext context) {
    return Center(
      child: Text(
        errorMessaga ?? AppStrings.errorMessaga,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.theme.colorScheme.error,
        ),
      ),
    );
  }
}
