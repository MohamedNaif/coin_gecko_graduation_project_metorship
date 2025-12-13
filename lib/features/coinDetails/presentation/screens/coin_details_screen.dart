import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/coin_details_cubit.dart';
import '../cubit/coin_details_state.dart';
import '../widgets/coin_details_header.dart';
import '../widgets/coin_details_info.dart';
import '../widgets/coin_details_price_section.dart';
import '../widgets/coin_details_statistics.dart';
import '../widgets/coin_details_about.dart';
import '../widgets/coin_details_actions.dart';

class CoinDetailsView extends StatelessWidget {
  const CoinDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: BlocBuilder<CoinDetailsCubit, CoinDetailsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $message'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CoinDetailsCubit>().loadCoinDetails('bitcoin');
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              loaded: (coinDetails, chartData, selectedTimeframe) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const CoinDetailsHeader(),
                          CoinDetailsInfo(coin: coinDetails),
                          CoinDetailsPriceSection(
                            coin: coinDetails,
                            chartData: chartData,
                            selectedTimeframe: selectedTimeframe,
                          ),
                          const SizedBox(height: 16),
                          CoinDetailsStatistics(coin: coinDetails),
                          const SizedBox(height: 16),
                          CoinDetailsAbout(coin: coinDetails),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                    const CoinDetailsActions(),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
