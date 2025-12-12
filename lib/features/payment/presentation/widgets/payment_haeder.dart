import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class PaymentHeader extends StatelessWidget {
  const PaymentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_back_ios_new,
        ),
        SizedBox(width: context.widthScale(62)),
        Text(AppStrings.paymentMethod,
            style: AppTextStyles.bold24
                .copyWith(color: context.theme.primaryColor)),
      ],
    );
  }
}
