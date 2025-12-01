import 'package:coin_gecko_graduation_project_metorship/core/constants/portfolio_bubble_dimensions.dart';
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
              top: context.heightScale(isTopRight
                  ? PortfolioBubbleDimensions.topRight1
                  : PortfolioBubbleDimensions.topLeft1),
              sideOffset: context.widthScale(isTopRight
                  ? PortfolioBubbleDimensions.sideRight1
                  : PortfolioBubbleDimensions.sideLeft1),
              size: context.heightScale(PortfolioBubbleDimensions.sizeSmall),
              opacity: PortfolioBubbleDimensions.opacityHigh),
          _bubble(context,
              top: context.heightScale(isTopRight
                  ? PortfolioBubbleDimensions.topRight2
                  : PortfolioBubbleDimensions.topLeft2),
              sideOffset: context.widthScale(isTopRight
                  ? PortfolioBubbleDimensions.sideRight2
                  : PortfolioBubbleDimensions.sideLeft2),
              size: context.heightScale(PortfolioBubbleDimensions.sizeMedium),
              opacity: PortfolioBubbleDimensions.opacityMedium),
          _bubble(context,
              top: context.heightScale(isTopRight
                  ? PortfolioBubbleDimensions.topRight3
                  : PortfolioBubbleDimensions.topLeft3),
              sideOffset: context.widthScale(isTopRight
                  ? PortfolioBubbleDimensions.sideRight3
                  : PortfolioBubbleDimensions.sideLeft3),
              size: context.heightScale(PortfolioBubbleDimensions.sizeLarge),
              opacity: PortfolioBubbleDimensions.opacityLow),
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
