import 'package:flutter/material.dart';
import 'dart:math';

class ScaleRotateSlideLoopAnimation extends StatefulWidget {
  const ScaleRotateSlideLoopAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1), // سرعة القفز

    this.beginScale = 0.6, // تصغير عند النزول
    this.endScale = 1.2, // تكبير عند القفز
    this.curve = Curves.easeInOut, // انسيابية الحركة
  });

  final Widget child;
  final Duration duration;

  final double beginScale;
  final double endScale;
  final Curve curve;

  @override
  State<ScaleRotateSlideLoopAnimation> createState() =>
      _ScaleRotateSlideLoopAnimationState();
}

class _ScaleRotateSlideLoopAnimationState
    extends State<ScaleRotateSlideLoopAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true); // تشغيل اللوب بشكل مستمر

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0), // يبدأ من الأسفل
      end: const Offset(0, -0.6), // يقفز للأعلى
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );

    _scaleAnimation = Tween<double>(
      begin: widget.beginScale,
      end: widget.endScale,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );

    // الدوران يحدث فقط عند الوصول لأعلى نقطة
    _rotationAnimation = TweenSequence<double>([
      TweenSequenceItem(
          tween: ConstantTween<double>(0.0), weight: 50), // لا يدور عند الصعود
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.0, end: 2 * pi),
          weight: 50), // يدور 360 درجة عند القمة
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: Transform.rotate(
            angle: _rotationAnimation.value, // يدور فقط عند القفز للأعلى
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: child,
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}
