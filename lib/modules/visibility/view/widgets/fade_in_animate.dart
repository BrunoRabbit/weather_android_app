import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

enum FadeTypes {
  fadeInLeft,
  fadeInRight,
  fadeInUp,
  fadeInDown,
}

class FadeInAnimate extends StatelessWidget {
  const FadeInAnimate(
    this.delay,
    this.types, {
    Key? key,
    required this.child,
  }) : super(key: key);

  final int delay;
  final Widget child;
  final FadeTypes types;

  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(milliseconds: delay);

    switch (types) {
      case FadeTypes.fadeInLeft:
        return FadeInLeft(
          delay: duration,
          child: child,
        );
      case FadeTypes.fadeInRight:
        return FadeInRight(
          delay: duration,
          child: child,
        );

      case FadeTypes.fadeInUp:
        return FadeInUp(
          delay: duration,
          child: child,
        );

      case FadeTypes.fadeInDown:
        return FadeInDown(
          delay: duration,
          child: child,
        );

      default:
        return Container();
    }
  }
}
