import 'package:coin_gecko_graduation_project_metorship/core/animations/animated_widgets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/animations/page_fade_transition.dart';
import 'package:coin_gecko_graduation_project_metorship/core/animations/page_slide_transition.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/screens/faceid_camera_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/custom_background.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/fingerprint_scan_continue_button.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/fingerprint_scan_description.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/fingerprint_scan_skip_button.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/widgets/fingerprint_scan_success_header.dart';
import 'package:flutter/material.dart';

class FingerprintScanningScreen extends StatefulWidget {
  const FingerprintScanningScreen({super.key});

  @override
  State<FingerprintScanningScreen> createState() =>
      _FingerprintScanningScreenState();
}

class _FingerprintScanningScreenState extends State<FingerprintScanningScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.biometricPaddingHorizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedScaleInWidget(
                duration: const Duration(milliseconds: 800),
                child: const FingerprintScanSuccessHeader(),
              ),
              AnimatedSlideInWidget(
                duration: const Duration(milliseconds: 1000),
                child: const FingerprintScanDescription(),
              ),
              const Spacer(),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        AnimatedScaleInWidget(
          duration: const Duration(milliseconds: 500),
          child: FingerprintScanContinueButton(
            onTap: () => Navigator.of(context).pushReplacement(
              PageSlideTransition(
                page: const FaceIdCameraScreen(),
                direction: AxisDirection.left,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        AnimatedFadeInWidget(
          duration: const Duration(milliseconds: 1200),
          child: FingerprintScanSkipButton(
            onPressed: () => Navigator.of(context).pushReplacement(
              PageFadeTransition(page: const Scaffold()),
            ),
          ),
        ),
      ],
    );
  }
}