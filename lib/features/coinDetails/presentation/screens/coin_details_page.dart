import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/features/coinDetails/data/data_source/coin_details_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/coinDetails/data/repo/coin_details_repo.dart';
import 'package:dio/dio.dart';
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
        getCoinDetails: GetCoinDetails(
          CoinRepositoryImpl(CoinRemoteDataSource(getIt<Dio>())),
        ),
        getChartData: GetChartData(
          CoinRepositoryImpl(CoinRemoteDataSource(getIt<Dio>())),
        ),
      )..loadCoinDetails(coinId),
      child: const CoinDetailsView(),
    );
  }
}

