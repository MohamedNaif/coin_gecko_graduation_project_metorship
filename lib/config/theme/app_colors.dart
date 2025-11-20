import 'package:flutter/material.dart';

abstract class AppColors {
  // Brand gradient
  static const linear = LinearGradient(
    colors: [Color(0xff913e35), Color(0xff743938)],
  );

  // Primary brand (aliases preserved)
  static const Color primary1 = Color(0xff9775FA);
  static const Color primary2 = Color(0xff823C37);

  // Primary scale and surfaces
  static const Color primary50 = Color(0xffFCF4F4);
  static const Color primary100 = Color(0xffF9E8E7);
  static const Color primary200 = Color(0xffF5D4D3);
  static const Color primary600 = Color(0xffBE4744);
  static const Color primary700 = Color(0xffA13A37);
  static const Color primary800 = Color(0xff843230);
  static const Color primary900 = Color(0xff6F2F2D);

  // Text colors
  static const Color textMain = Color(0xff292929);
  static const Color textSubtle = Color(0xff7C7C7C);

  // Neutrals / grayscale
  static const Color white = Color(0xffFFFFFF);
  static const Color white50 = Color(0x80FFFFFF); // 50% overlay
  static const Color black = Color(0xff000000);
  static const Color neutral900 = Color(0xff1E1E1E);
  static const Color neutral800 = Color(0xff464646);
  static const Color neutral700 = Color(0xff525252);
  static const Color neutral650 = Color(0xff575961);
  static const Color neutral500 = Color(0xff989898);
  static const Color neutral300 = Color(0xffD8D8D8);
  static const Color neutral200 = Color(0xffDCDCDC);
  static const Color neutral150 = Color(0xffEFEFEF);
  static const Color neutral100 = Color(0xffF7F7F7);
  static const Color background = Color(0xffF8F8F8);
  static const Color statusInProgress = Color(0xffE1B400);

  // Borders / surfaces
  static const Color grayscaleBackground = Color(0xffFFFFFF);
  static const Color grayscaleBorder = Color(0xffD0D5DD);
  static const Color lightBorder = Color(0xffEFEFEF);

  // Status colors
  static const Color statesError = Color(0xffF04438);
  static const Color statesInfo = Color(0xff2E90FA);
  static const Color statesSuccess = Color(0xff12B76A);
  static const Color red = Color(0xffF31616);
  static const Color yellow = Color(0xffE0BB3A);

  static const Color zinc700 = Color(0xff374151);
}
