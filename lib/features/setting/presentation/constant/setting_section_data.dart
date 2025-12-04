import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/domain/entity/setting_tile_entity.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/widgets/change_lanuage.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/widgets/dark_model_switch.dart';
import 'package:flutter/material.dart';

class SettingsSectionData {
  static List<SettingTile> items(
          BuildContext context, Function(bool) onChanged, bool value) =>
      [
        SettingTile(
          title: AppStrings.language,
          prefixIcon: Icons.language,
          suffixIcon: ChangeLanguage(),
        ),
        SettingTile(
          title: AppStrings.darkMode,
          prefixIcon: Icons.dark_mode_outlined,
          suffixIcon: DarkModeSwitch(),
        ),
      ];
}
