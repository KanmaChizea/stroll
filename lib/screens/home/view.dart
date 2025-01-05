import 'package:flutter/material.dart';
import 'package:stroll/theme/extension.dart';
import 'package:stroll/widgets/shared/badge.dart';
import 'package:stroll/widgets/shared/svg_icons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).appColors.background,
        items: [
          const BottomNavigationBarItem(
            icon: SvgIcon(name: 'card'),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Stack(
              children: [
                SvgIcon(name: 'bonfire'),
                AppBadge(),
              ],
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Stack(
              children: [
                SvgIcon(name: 'chat'),
                AppBadge(count: 10),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              name: 'person',
              size: 24,
              color: Theme.of(context).appColors.grey,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
