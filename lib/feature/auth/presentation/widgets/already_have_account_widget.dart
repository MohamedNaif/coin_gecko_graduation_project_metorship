import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
                text: TextSpan(
                text: 'Already have an account? ',
                style: context.textTheme.labelMedium?.copyWith(
                  fontSize: 18,
                  color: AppColors.gray900,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(
                            context, Routes.login);
                      },
                    text: 'Login',
                    style:context.textTheme.labelMedium?.copyWith(
                      fontSize: 18,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ],
              ),)
            ;
  }
}