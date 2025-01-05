import 'package:flutter/material.dart';

class ShrinkDismissible extends StatelessWidget {
  final Widget child;
  final AnimationController controller;

  const ShrinkDismissible({
    required this.child,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final scale = 1.0 - controller.value;
        return Transform.scale(
          scale: scale,
          child: Opacity(
            opacity: scale,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
