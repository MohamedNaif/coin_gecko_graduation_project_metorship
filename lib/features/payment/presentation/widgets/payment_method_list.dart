import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/constant/payment_method_data.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/widgets/custom_payment_tile.dart';
import 'package:flutter/material.dart';

class PaymentMethodList extends StatelessWidget {
  const PaymentMethodList({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomPaymentTile> paymentMethodList =
        PaymentMethodListData.paymentMethodList(context);
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return paymentMethodList[index];
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: paymentMethodList.length,
    );
  }
}
