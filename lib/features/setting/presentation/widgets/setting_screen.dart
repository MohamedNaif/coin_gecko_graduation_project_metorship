import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/constant/setting_section_data.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/widgets/build_section_list.dart';
import 'package:flutter/material.dart';

class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return BuildSectionList(
        items: SettingsSectionData.items(
      context,
      _changeDarkMode,
      isDarkMode,
    ));
  }

  void _changeDarkMode(bool value) {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
}
