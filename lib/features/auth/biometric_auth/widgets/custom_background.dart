import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  AppColors.lightBackground,
                  Color(0xFFE8EAF6),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -100,
                  right: -125,
                  child: Container(
                    width: 342,
                    height: 342,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF1D3A70).withValues(alpha: 0.15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
