import 'package:coin_gecko_graduation_project_metorship/core/api/dio_consumer.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/data_source/portfolio_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/data/repository/portfolio_repository.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/cubit/portfolio_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/portfolio_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      compact: true,
    ));
    return BlocProvider(
      lazy: false,
      create: (context) => PortfolioCubit(
          repository: PortfolioRepositoryImpl(PortfolioRemoteDataSource(dio)))
        ..getSimplePrice(
            id: 'bitcoin', vsCurrencies: 'usd', includeChange: true),
      child: Scaffold(
        body: PortfolioBody(),
      ),
    );
  }
}
