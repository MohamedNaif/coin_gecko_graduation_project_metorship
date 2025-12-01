import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryDark = Color(0xFF1E1F4B);
  static const Color primaryLight = Color(0xFF1D3A70);
  static const Color secondary = Color(0xFFF26666);

  static const Color success = Color(0xFF00CB6A);
  static const Color successLight = Color(0xFF69D895);

  static const Color darkBackground = Color(0xFF000000);
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkSurface2 = Color(0xFF222222);
  static const Color darkElevatedSurface = Color(0xFF1E1E1E);

  static const Color lightBackground = Color(0xFFF5F8FE);
  static const Color lightSurface = Color(0xFFF7F7F7);
  static const Color lightCardSurface = Color(0xFFEDF9F7);

  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFF979797);
  static const Color darkTextMuted = Color(0xFF8C8C8C);

  static const Color lightTextPrimary = Color(0xFF000000);
  static const Color lightTextSecondary = Color(0xFF494D58);
  static const Color lightTextMuted = Color(0xFF979797);

  static const Color gray50 = Color(0xFFF7F7F7);
  static const Color gray100 = Color(0xFFEDF9F7);
  static const Color gray200 = Color(0xFFE0E0E0);
  static const Color gray300 = Color(0xFF979797);
  static const Color gray400 = Color(0xFF8C8C8C);
  static const Color gray500 = Color(0xFF494D58);
  static const Color gray600 = Color(0xFF222222);
  static const Color gray700 = Color(0xFF121212);
  static const Color gray800 = Color(0xFF1E1E1E);
  static const Color gray900 = Color(0xff8E949A);
  static const Color dividerColor = Color(
    0xFFCBD5E1,
  );
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  static const Color deepBlue = Color(0xff1D3A70);
  static const Color lightGrayishBlue = Color(0xffF5F8FE);
  static const Color mediumPurple = Color(0XFF8979FF);
  static const Color lightGreen = Color(0xff3CC3DF);
  static const Color lightRed = Color(0xffFF928A);
  static const Color smokyBlack = Color(0xff0D0D0D);

// used in container shadow
  static const Color lightShadowColor = Color(0x14344BC1);
  static const Color darkShadowColor = Color(0x14FFFFFF);

  static const LinearGradient balanceCardDarkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E1F4B), Color(0xFF2A2F6B)],
  );

  static const LinearGradient balanceCardLightGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1E1F4B), Color(0xFF4766F9)],
  );
}
