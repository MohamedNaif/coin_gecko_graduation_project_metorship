import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/core/responsive_helper/screen_width_breakpoints.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  final WidgetBuilder mobileLayout, tabletLayout, desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < ScreenWidthBreakpoints.tablet) {
          return mobileLayout(context);
        } else if (constraints.maxWidth < ScreenWidthBreakpoints.desktop) {
          return tabletLayout(context);
        } else {
          return desktopLayout(context);
        }
      },
    );
  }
}
