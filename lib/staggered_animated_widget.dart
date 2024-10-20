// lib/staggered_animated_widget.dart
import 'package:flutter/material.dart';
import 'animation_direction.dart';

/// A widget that provides staggered animations for its child.
///
/// You can customize the animation duration, delay, curve, and direction.
class StaggeredAnimatedWidget extends StatefulWidget {
  /// Creates a [StaggeredAnimatedWidget].
  const StaggeredAnimatedWidget({
    super.key,
    required this.delay,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeInOut,
    this.direction = AnimationDirection.fromBottom,
  });

  /// The widget to animate.
  final Widget child;

  /// The delay before the animation starts (in milliseconds).
  final int delay;

  /// The duration of the animation (default is 800 milliseconds).
  final Duration duration;

  /// The curve used for the animation (default is `Curves.easeInOut`).
  final Curve curve;

  /// The direction from which the widget will enter.
  final AnimationDirection direction;

  @override
  StaggeredAnimatedWidgetState createState() => StaggeredAnimatedWidgetState();
}

class StaggeredAnimatedWidgetState extends State<StaggeredAnimatedWidget>
    with TickerProviderStateMixin {
  // (The rest of the implementation remains the same)

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    Offset beginOffset;
    switch (widget.direction) {
      case AnimationDirection.fromTop:
        beginOffset = const Offset(0, -1);
        break;
      case AnimationDirection.fromBottom:
        beginOffset = const Offset(0, 1);
        break;
      case AnimationDirection.fromLeft:
        beginOffset = const Offset(-1, 0);
        break;
      case AnimationDirection.fromRight:
        beginOffset = const Offset(1, 0);
        break;
    }

    _offsetAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    Future.delayed(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
      ),
    );
  }
}
