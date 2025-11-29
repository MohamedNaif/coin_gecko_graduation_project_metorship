import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 12),
          Text(
            'Hi, Naif 👋🏽',
            style: AppTextStyles.semiBold16.copyWith(
              color: Colors.black, // Adjust for dark mode if needed
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppAssets.iconNotification,
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
