import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/model/payment_body.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/widgets/buy_buttom.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/widgets/payment_haeder.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/widgets/payment_method_list.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/widgets/send_receipt.dart';
import 'package:flutter/material.dart';

class PaymentMethodBody extends StatelessWidget {
  const PaymentMethodBody({super.key, required this.paymentBody});
  final PaymentBody paymentBody;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimensions.paddingButton),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PaymentHeader(),
                    SizedBox(
                      height: 32,
                    ),
                    PaymentMethodList(),
                  ],
                ),
              ),
            ),
            SendReceipt(),
            SizedBox(
              height: 54,
            ),
            BuyBottom(
              paymentBody: paymentBody,
            ),
          ],
        ),
      ),
    );
  }
}
