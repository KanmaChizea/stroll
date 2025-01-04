import 'package:flutter/widgets.dart';
import 'package:stroll/utils/scaling.dart';

class AppSpacing {
  static EdgeInsets appPadding = Scaling.isSmallDevice
      ? const EdgeInsets.all(16)
      : const EdgeInsets.all(32);
  static EdgeInsets formPadding = Scaling.isSmallDevice
      ? const EdgeInsets.fromLTRB(16, 0, 16, 32)
      : const EdgeInsets.fromLTRB(32, 0, 32, 48);
  static double leadingWidth = Scaling.scaleHorizontal(
    78,
  );
}

class VerticalSpacing extends StatelessWidget {
  final double height;
  const VerticalSpacing(this.height, {super.key});

  @override
  Widget build(BuildContext context) =>
      SizedBox(height: Scaling.scaleVertical(height));
}

class HorizontalSpacing extends StatelessWidget {
  final double width;
  const HorizontalSpacing(this.width, {super.key});

  @override
  Widget build(BuildContext context) =>
      SizedBox(width: Scaling.scaleHorizontal(width));
}
