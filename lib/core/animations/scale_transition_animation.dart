import 'package:flutter/material.dart';

class ScaleTransitionAnimation extends StatefulWidget {
  const ScaleTransitionAnimation({
    super.key,
    required this.child,
    required this.duration,
    this.isVisible = false,
  });

  final Widget child;
  final Duration duration;
  final bool isVisible;

  @override
  State<ScaleTransitionAnimation> createState() =>
      _ScaleTransitionAnimationState();
}

class _ScaleTransitionAnimationState extends State<ScaleTransitionAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _updateAnimation();
  }

  @override
  void didUpdateWidget(ScaleTransitionAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateAnimation();
  }

  void _updateAnimation() {
    if (widget.isVisible) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
