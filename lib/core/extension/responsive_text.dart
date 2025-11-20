import 'package:flutter/material.dart';

class ResponsiveScale {
  static final ResponsiveScale _instance = ResponsiveScale._internal();

  factory ResponsiveScale() => _instance;

  ResponsiveScale._internal();

  double _scaleFactor = 1.0;

  void init(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width < ResponsiveBreakpoints.tablet) {
      _scaleFactor = width / 550;
    } else if (width < ResponsiveBreakpoints.desktop) {
      _scaleFactor = width / 1000;
    } else {
      _scaleFactor = width / 1920;
    }
  }

  double get scaleFactor => _scaleFactor;
}

class ResponsiveBreakpoints {
  static const double desktop = 1200;
  static const double tablet = 800;
}

extension ResponsiveExtension on num {
  double get responsive {
    final double scaleFactor = ResponsiveScale().scaleFactor;
    final double responsiveValue = this * scaleFactor;
    final double lowerLimit = this * 0.8;
    final double upperLimit = this * 1.2;
    return responsiveValue.clamp(lowerLimit, upperLimit);
  }
}
