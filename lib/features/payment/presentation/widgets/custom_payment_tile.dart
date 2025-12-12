import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class CustomPaymentTile extends StatelessWidget {
  const CustomPaymentTile(
      {super.key, required this.name, required this.children});
  final String name;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: ListTile(
        tileColor: context.theme.canvasColor,
        title: Text(
          name,
          style: AppTextStyles.semiBold16.copyWith(
            color: context.theme.primaryColor,
          ),
        ),
      ),
      children: children,
    );
  }
}
