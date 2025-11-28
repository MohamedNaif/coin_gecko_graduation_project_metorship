import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/core/responsive_helper/responsive_font_size.dart';
import 'package:coin_gecko_graduation_project_metorship/core/responsive_helper/screen_width_breakpoints.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}

extension TextThemeHelper on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}

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

  bool get isMobile => width < ScreenWidthBreakpoints.tablet;
  bool get isTablet =>
      width >= ScreenWidthBreakpoints.tablet &&
      width < ScreenWidthBreakpoints.desktop;
  bool get isDesktop => width >= ScreenWidthBreakpoints.desktop;

  double get getIconsSizeForTextField {
    if (width < ScreenWidthBreakpoints.tablet) {
      return 20.0;
    } else {
      return 24.0;
    }
  }

  T withFormFactor<T>({
    required T onMobile,
    required T onTablet,
    required T onDesktop,
  }) {
    if (width < ScreenWidthBreakpoints.tablet) {
      return onMobile;
    } else if (width < ScreenWidthBreakpoints.desktop) {
      return onTablet;
    } else {
      return onDesktop;
    }
  }
}

extension ResponsiveDouble on double {
  double get responsive => ResponsiveFontSize.getResponsiveFontSize(
        NavigationService.navigatorKey.currentContext!,
        this,
      );
}

extension ResponsiveContext on BuildContext {
  double get realScreenWidth => isLandscape
      ? MediaQuery.of(this).size.height
      : MediaQuery.of(this).size.width;

  double get realScreenHeight => isLandscape
      ? MediaQuery.of(this).size.width
      : MediaQuery.of(this).size.height;
}

/// Converts design-based width/height to responsive (device-scaled) values.
extension ResponsiveSize on BuildContext {
  double widthScale(double designWidth) {
    final deviceWidth = MediaQuery.sizeOf(this).width;
    const designScreenWidth = 375;
    return designWidth * (deviceWidth / designScreenWidth);
  }

  double heightScale(double designHeight) {
    final deviceHeight = MediaQuery.sizeOf(this).height;
    const designScreenHeight = 827;
    return designHeight * (deviceHeight / designScreenHeight);
  }
}
