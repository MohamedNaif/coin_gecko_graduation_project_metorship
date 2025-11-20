import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/core/responsive_helper/screen_width_breakpoints.dart';

class ResponsiveFontSize {
  // scaleFactor
  // responsive font size
  // (min , max) font size
  static double getResponsiveFontSize(BuildContext context, double fontSize) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.08;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor(context) {
    // var dispatcher = PlatformDispatcher.instance;
    // var physicalWidth = dispatcher.views.first.physicalSize.width;
    // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
    // double width = physicalWidth / devicePixelRatio;

    double width = MediaQuery.sizeOf(context).width;

    if (width < ScreenWidthBreakpoints.tablet) {
      return width / 400;
    } else if (width < ScreenWidthBreakpoints.desktop) {
      return width / 750;
    } else {
      return width / 1200;
    }
  }
}
