import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class PaymentMethodsRow extends StatelessWidget {
  const PaymentMethodsRow({super.key});

  @override
  Widget build(BuildContext context) {
    double logoWidth = context.widthScale(93);
    double logoHeight = context.heightScale(36);
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimensions.spacingXSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppAssets.visaLogo,
            width: logoWidth,
            height: logoHeight,
          ),
          Image.asset(
            AppAssets.masterCard,
            width: logoWidth,
            height: logoHeight,
          ),
          Image.asset(
            AppAssets.applePayIcon,
            width: logoWidth,
            height: logoHeight,
          ),
        ],
      ),
    );
  }
}
