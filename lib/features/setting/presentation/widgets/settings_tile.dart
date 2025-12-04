import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/domain/entity/setting_tile_entity.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key, required this.model});

  final SettingTile model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: model.onTap,
      contentPadding: EdgeInsets.zero,
      leading: _buildPrefixIcon(context),
      title: Text(model.title, style: AppTextStyles.semiBold16),
      trailing: model.suffixIcon ??
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: context.theme.primaryColor,
          ),
    );
  }

  Widget _buildPrefixIcon(BuildContext context) => Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.theme.primaryColor,
        ),
        child: Icon(
          model.prefixIcon,
          color: context.theme.scaffoldBackgroundColor,
          size: 24,
        ),
      );
}
