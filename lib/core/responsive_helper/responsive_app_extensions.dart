import 'package:flutter/cupertino.dart';
import 'package:coin_gecko_graduation_project_metorship/core/responsive_helper/screen_width_breakpoints.dart';

extension ResponsiveAppExtensions on BuildContext {
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  double get realScreenWidth => isLandscape
      ? MediaQuery.of(this).size.height
      : MediaQuery.of(this).size.width;

  double get realScreenHeight => isLandscape
      ? MediaQuery.of(this).size.width
      : MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get getIconsSizeForTextField {
    if (width < ScreenWidthBreakpoints.tablet) {
      return 20.0;
    } else {
      return 24.0;
    }
  }

  // example usage for grid view count
  T withFormFactor<T>({
    required T onMobile,
    required T onTablet,
    required T onDesktop,
    bool followDeviceOrientation = true,
  }) {
    //log('========== Screen width: $width ==========');
    if (width < ScreenWidthBreakpoints.tablet) {
      //log('onMobile');
      return onMobile;
    } else if (width < ScreenWidthBreakpoints.desktop) {
      //log('onTablet');
      return onTablet;
    } else {
      // log('onDesktop');
      return onDesktop;
    }
  }
}
