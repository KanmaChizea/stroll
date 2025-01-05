import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height - 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.6, 1.0],
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.12),
                Colors.black.withOpacity(0),
              ],
            ),
          ),
        ),
        Container(
          width: size.width,
          height: size.height - 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.5, 0.55, 0.59, 0.61, 0.63],
              colors: [
                const Color(0xFF0F1115).withOpacity(0),
                const Color(0xFF0D0E12).withOpacity(0.28),
                const Color(0xFF0B0C0F).withOpacity(0.64),
                const Color(0xFF090B0D).withOpacity(0.8),
                Colors.black,
              ],
            ),
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.height - 100,
          child: child,
        ),
      ],
    );
  }
}
