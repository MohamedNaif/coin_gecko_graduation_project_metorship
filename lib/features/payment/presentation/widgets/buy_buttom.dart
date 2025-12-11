import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BuyBottom extends StatelessWidget {
  const BuyBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: 31,
      text: AppStrings.buy,
      onTap: () {},
    );
  }
}
