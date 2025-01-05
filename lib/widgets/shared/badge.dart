import 'package:flutter/material.dart';
import 'package:stroll/theme/extension.dart';

class AppBadge extends StatelessWidget {
  const AppBadge({this.count, super.key});
  final int? count;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4.5),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.primary.shade300,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              width: 1.4, color: Theme.of(context).appColors.background),
        ),
        child: Center(
          child: Text(
            count != null ? count.toString() : '   ',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 7,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
