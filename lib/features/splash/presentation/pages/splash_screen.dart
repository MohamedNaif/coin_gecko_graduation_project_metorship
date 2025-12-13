import 'dart:async';
import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Constants
  static const Duration _splashDuration = Duration(seconds: 3);
  static const double _logoSize = 150.0;
  static const double _topCircleSize = 300.0;
  static const double _bottomCircleSize = 400.0;

  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _scheduleNavigation();
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackgroundCircles(),
          _buildLogo(),
        ],
      ),
    );
  }

  Widget _buildBackgroundCircles() {
    return Stack(
      children: [
        _buildTopCircle(),
        _buildBottomCircle(),
      ],
    );
  }

  Widget _buildTopCircle() {
    return Positioned(
      top: -100,
      left: -100,
      child: _buildCircle(
        size: _topCircleSize,
        color: Colors.grey[200],
      ),
    );
  }

  Widget _buildBottomCircle() {
    return Positioned(
      bottom: -150,
      right: -150,
      child: _buildCircle(
        size: _bottomCircleSize,
        color: Colors.grey[100],
      ),
    );
  }

  Widget _buildCircle({required double size, required Color? color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: SvgPicture.asset(
        AppAssets.iconApp,
        width: _logoSize,
        height: _logoSize,
      ),
    );
  }

  // Navigation logic
  void _scheduleNavigation() {
    _navigationTimer = Timer(_splashDuration, _navigateToOnboarding);
  }

  void _navigateToOnboarding() {
    if (!mounted) return;
    
    Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
    // Navigator.pushReplacementNamed(context, Routes.homeScreen);
  }
}