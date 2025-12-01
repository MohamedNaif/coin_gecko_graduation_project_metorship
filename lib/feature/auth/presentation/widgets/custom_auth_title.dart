// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';

class CustomAuthTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomAuthTitle({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
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
          subTitle,
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
