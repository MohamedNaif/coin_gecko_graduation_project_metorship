import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class LoginMethodsSection extends StatelessWidget {
  const LoginMethodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            color: Color(
              0xFFCBD5E1,
            ),
            height: 5,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Or Login with",
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primaryLight,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Color(
                0xFFCBD5E1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
