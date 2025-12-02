import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/holding/states/holding_error_state_widget.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/holding/states/holding_success_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoldingsSection extends StatelessWidget {
  const HoldingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioCubit, PortfolioState>(
      buildWhen: (previous, current) => current.state != States.initial,
      builder: (context, state) {
        switch (state.state) {
          case States.loading:
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          case States.success:
            return HoldingSectionSuccessState(
                coins: state.simplePriceModel?.coins ?? []);
          case States.failure:
            return HoldingSectionErrorState(
              errorMessage: state.errorMessage,
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
