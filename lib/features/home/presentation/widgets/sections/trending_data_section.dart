import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_error_widget.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/trending_list.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/trending_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingDataSection extends StatelessWidget {
  const TrendingDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.trendingDataStatus != current.trendingDataStatus,
      builder: (context, state) {
        if (state.trendingDataStatus == HomeDataStatus.loading) {
          return const TrendingListShimmer();
        } else if (state.trendingDataStatus == HomeDataStatus.failure) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage ?? 'Failed to load trending coins',
            onRetry: () => context.read<HomeCubit>().getTrendingCoins(),
          );
        } else if (state.trendingData != null) {
          return TrendingList(data: state.trendingData!);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
