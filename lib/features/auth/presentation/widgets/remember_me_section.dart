import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class RememberMeSection extends StatelessWidget {
  const RememberMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.rememberMeSectionHorizontal,
      ),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
            side: const BorderSide(
              color: AppColors.primaryLight,
              width: AppDimensions.borderWidth,
            ),
          ),
          Text(
            AppStrings.rememberMe,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryLight,
            ),
          ),
          const Spacer(),
          Text(
            AppStrings.forgotPassword,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryLight,
            ),
          ),
        ],
      ),
    );
  }
}