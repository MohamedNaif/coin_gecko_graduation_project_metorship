import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: AppDimensions.profileAvatarRadius,
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/400',
          ),
        ),
        const SizedBox(height: 16),
        Text('Sophia Isabella', style: AppTextStyles.bold20),
      ],
    );
  }
}
