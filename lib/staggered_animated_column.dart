import 'package:flutter/material.dart';

import 'animation_direction.dart';
import 'staggered_animated_widget.dart';

/// A column that applies staggered animations to its children.
class StaggeredAnimatedColumn extends StatelessWidget {
  /// Creates a [StaggeredAnimatedColumn].
  const StaggeredAnimatedColumn({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    required this.children,
    this.delayIncrement = 200,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeInOut,
    this.direction = AnimationDirection.fromLeft,
    this.spacing,
  });

  /// The children widgets that will be animated.
  final List<Widget> children;

  /// The delay increment for each child (in milliseconds).
  final int delayIncrement;

  /// The duration of each animation.
  final Duration duration;

  /// The curve used for the animation.
  final Curve curve;

  /// The direction from which each widget will enter.
  final AnimationDirection direction;

  /// Column properties
  final double? spacing;

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: spacing ?? 0.0,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: [
        for (int i = 0; i < children.length; i++)
          StaggeredAnimatedWidget(
            delay: (i + 1) * delayIncrement,
            duration: duration,
            curve: curve,
            direction: direction,
            child: children[i],
          ),
      ],
    );
  }
}
