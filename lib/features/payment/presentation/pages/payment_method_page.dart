import 'package:coin_gecko_graduation_project_metorship/features/payment/data/data_source/payment_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/model/payment_body.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/repository/payment_remote_repository.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/widgets/payment_methob_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key, required this.paymentBody});

  final PaymentBody paymentBody;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      create: (context) => PaymentCubit(
        paymentRemoteRepository: PaymentRemoteRepositoryImpl(
          PaymentRemoteDataSource(
            _createDio(),
          ),
        ),
      ),
      child: Scaffold(
        body: PaymentMethodBody(paymentBody: paymentBody),
      ),
    );
  }

// i will refactor this later
  Dio _createDio() {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET_KEY']} ',
      },
    ));

    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));

    return dio;
  }
}
