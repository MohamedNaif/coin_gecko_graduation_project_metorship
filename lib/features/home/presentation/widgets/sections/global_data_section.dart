import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_error_widget.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/market_overview.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/market_overview_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalDataSection extends StatelessWidget {
  const GlobalDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.globalDataStatus != current.globalDataStatus,
      builder: (context, state) {
        if (state.globalDataStatus == HomeDataStatus.loading) {
          return const MarketOverviewShimmer();
        } else if (state.globalDataStatus == HomeDataStatus.failure) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage ?? 'Failed to load global data',
            onRetry: () => context.read<HomeCubit>().getGlobalData(),
          );
        } else if (state.globalData != null) {
          return MarketOverview(data: state.globalData!);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
