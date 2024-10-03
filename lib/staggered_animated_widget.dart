// lib/staggered_animated_widget.dart
import 'package:flutter/material.dart';
import 'animation_direction.dart';

class StaggeredAnimatedWidget extends StatefulWidget {
  final Widget child;
  final int delay;
  final Duration duration;
  final Curve curve;
  final AnimationDirection direction;

  const StaggeredAnimatedWidget({
    super.key,
    required this.delay,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeInOut,
    this.direction = AnimationDirection.fromBottom,
  });

  @override
  StaggeredAnimatedWidgetState createState() => StaggeredAnimatedWidgetState();
}

class StaggeredAnimatedWidgetState extends State<StaggeredAnimatedWidget>
    with TickerProviderStateMixin {
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
