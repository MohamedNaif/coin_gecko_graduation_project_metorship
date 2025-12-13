import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/face_icon.dart';

/// Displays the Face ID camera frame with background image and centered face icon
class FaceIdCameraFrame extends StatelessWidget {
  const FaceIdCameraFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.faceIdBackground,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: FaceIcon(icon: AppAssets.faceIdIcon),
        ),
      ],
    );
  }
}
