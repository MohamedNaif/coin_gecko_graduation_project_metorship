import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_style.dart';

class _CustomThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(24, 24);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 8, paint);

    final Paint borderPaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(center, 8, borderPaint);
  }
}

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: 'Lato',
        scaffoldBackgroundColor: AppColors.lightBackground,
        canvasColor: AppColors.lightBackground,
        primaryColor: AppColors.primaryLight,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryLight,
          secondary: AppColors.secondary,
          surface: AppColors.lightSurface,
          background: AppColors.lightBackground,
          onPrimary: AppColors.white,
          onSecondary: AppColors.white,
          onSurface: AppColors.lightTextPrimary,
          onBackground: AppColors.lightTextPrimary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          foregroundColor: AppColors.lightTextPrimary,
          iconTheme: IconThemeData(color: AppColors.lightTextPrimary),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.lightTextPrimary,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primaryLight,
          unselectedItemColor: AppColors.gray400,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          elevation: 20,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.lightTextPrimary,
          ),
          displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.lightTextPrimary,
          ),
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.lightTextPrimary,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.lightTextPrimary,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.lightTextPrimary,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.lightTextSecondary,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryLight,
          ),
        ),
        dividerColor: AppColors.gray200.withOpacity(0.5),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Lato',
        scaffoldBackgroundColor: AppColors.darkBackground,
        canvasColor: AppColors.darkBackground,
        primaryColor: AppColors.primaryDark,
        colorScheme: ColorScheme.dark(
          primary: AppColors.primaryDark,
          surface: AppColors.darkSurface,
          background: AppColors.darkBackground,
          onPrimary: AppColors.white,
          onSurface: AppColors.darkTextPrimary,
          onBackground: AppColors.darkTextPrimary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkSurface,
          selectedItemColor: AppColors.darkTextPrimary,
          unselectedItemColor: AppColors.gray400,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          elevation: 20,
        ),
        textTheme: _buildTextTheme(),
        dividerColor: AppColors.gray600.withOpacity(0.3),
      );

  static TextTheme _buildTextTheme() {
    return TextTheme(
      displayLarge: AppTextStyles.bold32,
      displayMedium: AppTextStyles.bold28,
      displaySmall: AppTextStyles.bold24,
      headlineLarge: AppTextStyles.bold20,
      headlineMedium: AppTextStyles.bold20,
      headlineSmall: AppTextStyles.bold18,
      titleLarge: AppTextStyles.semiBold18,
      titleMedium: AppTextStyles.semiBold16,
      titleSmall: AppTextStyles.semiBold14,
      bodyLarge: AppTextStyles.regular16,
      bodyMedium: AppTextStyles.regular14,
      bodySmall: AppTextStyles.regular12,
      labelLarge: AppTextStyles.medium14,
      labelMedium: AppTextStyles.medium12,
      labelSmall: AppTextStyles.semiBold10,
    );
  }
}
