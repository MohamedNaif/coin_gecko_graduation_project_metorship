import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_chart_details.dart';
import '../../domain/usecase/get_coin_details.dart';
import '../cubit/coin_details_cubit.dart';
import 'coin_details_screen.dart';

class CoinDetailsPage extends StatelessWidget {
  final String coinId;

  const CoinDetailsPage({super.key, required this.coinId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinDetailsCubit(
        getCoinDetails: context.read<GetCoinDetails>(),
        getChartData: context.read<GetChartData>(),
      )..loadCoinDetails(coinId),
      child: const CoinDetailsView(),
    );
  }
}


