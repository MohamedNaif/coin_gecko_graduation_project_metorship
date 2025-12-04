import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/widgets/settings_header.dart';
import 'package:flutter/material.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.settingBodyHorizontalPadding,
            vertical: AppDimensions.settingBodyVerticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.settings, style: AppTextStyles.bold24),
            const SizedBox(height: 23),
            Align(alignment: Alignment.center, child: const SettingsHeader()),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
