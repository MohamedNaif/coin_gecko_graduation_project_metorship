import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingBody extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingBody({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            model.image,
            height: 300,
          ),
          const SizedBox(height: 40),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.bold24.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            model.description,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular16.copyWith(
              color: AppColors.gray300,
            ),
          ),
        ],
      ),
    );
  }
}
