import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: context.theme.primaryColor,
      ),
      // i will handle it later with team
      onPressed: () => _buildShowDialog(context),
    );
  }

  Future<dynamic> _buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppStrings.selectLanguage),
          content: const Text(AppStrings.chooseYourLanguage),
          actions: [
            TextButton(
              child: Text(
                AppStrings.arabic,
                style: context.textTheme.titleMedium,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                AppStrings.english,
                style: context.textTheme.titleMedium,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
