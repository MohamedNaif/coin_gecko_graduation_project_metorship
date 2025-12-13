import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/model/payment_body.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/cubit/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyBottom extends StatelessWidget {
  const BuyBottom({super.key, required this.paymentBody});
  final PaymentBody paymentBody;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PaymentCubit>();

    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return CustomButton(
          borderRadius: 31,
          text: state.maybeWhen(
            loading: () => "Loading...",
            orElse: () => AppStrings.buy,
          ),
          onTap: state.maybeWhen(
            loading: () => null,
            orElse: () => () async {
              await cubit.pay(paymentBody: paymentBody);
            },
          ),
        );
      },
    );
  }
}
