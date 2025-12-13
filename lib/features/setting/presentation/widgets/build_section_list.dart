import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/domain/entity/setting_tile_entity.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/widgets/settings_tile.dart';
import 'package:flutter/material.dart';

class BuildSectionList extends StatelessWidget {
  const BuildSectionList({super.key, required this.items});
  final List<SettingTile> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = items[index];
        return SettingsTile(model: item);
      },
      separatorBuilder: (_, index) => Divider(
          height: 20,
          thickness: 1,
          color: AppColors.davyGrey.withValues(alpha: 0.3)),
    );
  }
}
