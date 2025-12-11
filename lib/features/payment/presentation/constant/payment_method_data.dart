import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/widgets/credit_card_widget.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/widgets/custom_payment_tile.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/widgets/payment_method_row.dart';
import 'package:flutter/material.dart';

class PaymentMethodListData {
  static List<CustomPaymentTile> paymentMethodList(BuildContext context) => [
        CustomPaymentTile(
          name: AppStrings.creditCard,
          children: [
            const PaymentMethodsRow(),
            const SizedBox(height: 24),
            const CreditCard()
          ],
        ),
        CustomPaymentTile(
          name: AppStrings.googlePay,
          children: [_comingSoon(context)],
        ),
        CustomPaymentTile(
          name: AppStrings.mobileBanking,
          children: [_comingSoon(context)],
        ),
      ];
  static Text _comingSoon(BuildContext context) => Text(
        'Coming soon !',
        style: AppTextStyles.bold32.copyWith(color: context.theme.primaryColor),
      );
}
