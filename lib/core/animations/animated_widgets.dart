import 'package:coin_gecko_graduation_project_metorship/core/animations/fade_transition_animation.dart';
import 'package:coin_gecko_graduation_project_metorship/core/animations/scale_transition_animation.dart';
import 'package:coin_gecko_graduation_project_metorship/core/animations/slide_transition_animation.dart';
import 'package:flutter/material.dart';

/// Combines Slide + Fade animations for entrance effects
class AnimatedSlideInWidget extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Offset begin;
  final Curve curve;

  const AnimatedSlideInWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.begin = const Offset(0, -0.3),
    this.curve = Curves.easeOutCubic,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransitionAnimation(
      duration: duration,
      begin: begin,
      end: Offset.zero,
      curve: curve,
      child: FadeTransitionAnimation(
        duration: duration,
        child: child,
      ),
    );
  }
}

/// Combines Scale + Fade animations for emphasis
class AnimatedScaleInWidget extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final bool isVisible;

  const AnimatedScaleInWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.isVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransitionAnimation(
      duration: duration,
      isVisible: isVisible,
      child: FadeTransitionAnimation(
        duration: duration,
        child: child,
      ),
    );
  }
}

/// Combines Fade for simple appearance
class AnimatedFadeInWidget extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const AnimatedFadeInWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransitionAnimation(
      duration: duration,
      child: child,
    );
  }
}
