import 'package:flutter/material.dart';

class StrokedText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color strokeColor;
  final Color? textColor;
  final double strokeWidth;
  final FontWeight? fontWeight;
  final List<Shadow>? shadows;
  const StrokedText(this.text,
      {required this.strokeColor,
      required this.strokeWidth,
      this.fontSize,
      this.textColor,
      this.fontWeight,
      this.shadows,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
            shadows: shadows,
          ),
        ),
      ],
    );
  }
}
