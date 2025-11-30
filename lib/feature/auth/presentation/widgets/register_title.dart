import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Create Your Account',
          style: GoogleFonts.lato(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryLight,
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          "Sign up to enjoy the best managing \nexperience!",
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Color(0xFF18191F),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
