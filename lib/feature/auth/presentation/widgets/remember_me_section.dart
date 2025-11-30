import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class RememberMeSection extends StatelessWidget {
  const RememberMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
            side: BorderSide(
              color: AppColors.primaryLight,
              width: 1.5,
            ),
          ),
          Text(
            'Remember Me',
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryLight,
            ),
          ),
          Spacer(),
          Text(
            'Forgot Password?',
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
