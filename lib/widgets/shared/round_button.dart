import 'package:flutter/material.dart';
import 'package:stroll/theme/extension.dart';

class RoundButton extends StatelessWidget {
  final Widget child;
  final bool outline;
  final Function()? onPress;

  const RoundButton(
      {required this.child, this.onPress, this.outline = false, super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: !outline ? Theme.of(context).appColors.primary : null,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: outline
                ? Border.all(
                    color: Theme.of(context).appColors.primary, width: 2.2)
                : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
