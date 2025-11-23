import 'package:flutter/cupertino.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';

class CustomPagnationLoading extends StatelessWidget {
  const CustomPagnationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Center(
        child: CupertinoActivityIndicator(
          radius: 15,
          color: AppColors.primaryLight,
        ),
      ),
    );
  }
}
