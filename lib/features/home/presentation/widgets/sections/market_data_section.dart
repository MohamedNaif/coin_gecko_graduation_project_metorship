import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_error_widget.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/top_gainers_list.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/top_gainers_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketDataSection extends StatelessWidget {
  const MarketDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.marketDataStatus != current.marketDataStatus,
      builder: (context, state) {
        if (state.marketDataStatus == HomeDataStatus.loading &&
            state.marketData.isEmpty) {
          return const TopGainersListShimmer();
        } else if (state.marketDataStatus == HomeDataStatus.failure &&
            state.marketData.isEmpty) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage ?? 'Failed to load market data',
            onRetry: () => context.read<HomeCubit>().getMarkets(),
          );
        } else if (state.marketData.isNotEmpty) {
          return TopGainersList(data: state.marketData);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
