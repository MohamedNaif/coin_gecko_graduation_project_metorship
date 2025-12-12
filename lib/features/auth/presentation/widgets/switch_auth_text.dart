import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';

class SwitchAuthText extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onTap;
  const SwitchAuthText({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: questionText,
        style: context.textTheme.labelMedium?.copyWith(
          fontSize: 18,
          color: AppColors.gray900,
        ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: actionText,
            style: context.textTheme.labelMedium?.copyWith(
              fontSize: 18,
              color: AppColors.primaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
