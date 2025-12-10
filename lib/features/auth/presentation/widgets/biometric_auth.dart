import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BiometricAuthSection extends StatelessWidget {
  const BiometricAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            AppAssets.fingerPrintIcon,
            height: 50,
          ),
        ),
        SvgPicture.asset(AppAssets.faceId),
      ],
    );
  }
}
