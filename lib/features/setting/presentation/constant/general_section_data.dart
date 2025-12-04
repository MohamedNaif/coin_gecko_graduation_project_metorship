import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/domain/entity/setting_tile_entity.dart';
import 'package:flutter/material.dart';

class GeneralSectionData {
  static List<SettingTile> items(BuildContext context) => [
        SettingTile(
          title: AppStrings.myAccount,
          prefixIcon: Icons.person,
          onTap: () {},
        ),
        SettingTile(
          title: AppStrings.billingPayment,
          prefixIcon: Icons.payment,
          onTap: () {},
        ),
        SettingTile(
          title: AppStrings.fAQSupport,
          prefixIcon: Icons.question_mark,
          onTap: () {},
        ),
      ];
}
