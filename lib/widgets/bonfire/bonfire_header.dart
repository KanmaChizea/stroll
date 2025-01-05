import 'package:flutter/material.dart';
import 'package:stroll/theme/extension.dart';
import 'package:stroll/theme/spacing.dart';
import 'package:stroll/utils/date.dart';
import 'package:stroll/widgets/bonfire/shadowed_text_with_icon.dart';
import 'package:stroll/widgets/shared/stroked_text.dart';
import 'package:stroll/widgets/shared/svg_icons.dart';

class BonfireHeader extends StatelessWidget {
  final DateTime timeLeft;
  final int personCount;
  const BonfireHeader({
    required this.timeLeft,
    required this.personCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StrokedText(
              'Stroll Bonfire',
              fontSize: 34,
              fontWeight: FontWeight.w700,
              textColor: Theme.of(context).appColors.primary.shade200,
              strokeWidth: 0.32,
              strokeColor: Theme.of(context).appColors.primary.shade400,
              shadows: [
                Shadow(
                  offset: const Offset(0, 2),
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                ),
                Shadow(
                  offset: const Offset(0, 2),
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                ),
                Shadow(
                  offset: const Offset(0, 1),
                  color: const Color(0xFF24232F).withOpacity(0.5),
                  blurRadius: 2,
                ),
                Shadow(
                  offset: const Offset(0, 0),
                  color: const Color(0xFFBEBEBE).withOpacity(0.2),
                  blurRadius: 2,
                ),
                Shadow(
                  offset: const Offset(0, 0),
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 7.9,
                ),
              ],
            ),
            const HorizontalSpacing(8),
            const SvgIcon(name: 'arrow-down'),
          ],
        ),
        const VerticalSpacing(4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShadowedTextWithIcon(
                icon: 'clock', text: DateFormatter.getTimeLeft(timeLeft)),
            const HorizontalSpacing(8),
            ShadowedTextWithIcon(icon: 'person', text: personCount.toString()),
          ],
        ),
      ],
    );
  }
}
