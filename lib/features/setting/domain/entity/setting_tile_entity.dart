import 'package:flutter/material.dart';

class SettingTile {
  final String title;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  const SettingTile({
    required this.title,
    required this.prefixIcon,
    this.suffixIcon,
    this.onTap,
  });
}
