import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/material.dart';

class PortfolioBubbleBackground extends StatelessWidget {
  const PortfolioBubbleBackground({
    super.key,
    this.isTopRight = true,
  });

  final bool isTopRight;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          _bubble(context,
              top: isTopRight
                  ? context.heightScale(-20)
                  : context.heightScale(80),
              sideOffset: isTopRight
                  ? -context.widthScale(35)
                  : -context.widthScale(20),
              size: context.heightScale(80),
              opacity: 0.10),
          _bubble(context,
              top: isTopRight
                  ? context.heightScale(-40)
                  : context.heightScale(60),
              sideOffset: isTopRight
                  ? -context.widthScale(60)
                  : -context.widthScale(40),
              size: context.heightScale(120),
              opacity: 0.09),
          _bubble(context,
              top: isTopRight
                  ? context.heightScale(-60)
                  : context.heightScale(45),
              sideOffset: isTopRight
                  ? -context.widthScale(80)
                  : -context.widthScale(60),
              size: context.heightScale(157),
              opacity: 0.06),
        ],
      ),
    );
  }

  Widget _bubble(
    BuildContext context, {
    required double top,
    required double sideOffset,
    required double size,
    required double opacity,
  }) {
    return Positioned(
      top: top,
      right: isTopRight ? sideOffset : null,
      left: isTopRight ? null : sideOffset,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.theme.colorScheme.surface.withValues(alpha: opacity),
        ),
      ),
    );
  }
}
