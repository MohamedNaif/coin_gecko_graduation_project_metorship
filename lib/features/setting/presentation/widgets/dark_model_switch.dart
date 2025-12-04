import 'package:coin_gecko_graduation_project_metorship/core/constants/cache_keys.dart';
import 'package:coin_gecko_graduation_project_metorship/core/storage/cache_helper.dart';
import 'package:flutter/material.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({
    super.key,
  });

  static bool isDarkMode =
      AppSharedPreferences.sharedPreferences.getBool(CacheKeys.isDarkModeKey) ??
          false;
  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: DarkModeSwitch.isDarkMode,
        onChanged: (value) async {
          setState(() {
            DarkModeSwitch.isDarkMode = value;
            AppSharedPreferences.sharedPreferences
                .setBool(CacheKeys.isDarkModeKey, value);
          });
        });
  }
}
