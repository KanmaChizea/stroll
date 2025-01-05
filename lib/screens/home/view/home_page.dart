import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll/screens/home/view/view.dart';
import 'package:stroll/screens/home/view_model/view_model.dart';
import 'package:stroll/theme/extension.dart';
import 'package:stroll/widgets/shared/badge.dart';
import 'package:stroll/widgets/shared/svg_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeState = context.watch<HomeViewModel>().state;
    final activeTab = homeState.activeTab;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeTab.index,
        onTap: context.read<HomeViewModel>().updateTab,
        backgroundColor: Theme.of(context).appColors.background,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: SvgIcon(name: 'card'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const SvgIcon(name: 'bonfire'),
                if (homeState.hasUnseenBonfires) const AppBadge(),
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
      body: Builder(
        builder: (context) {
          switch (activeTab) {
            case TabState.home:
              return const CardView();
            case TabState.bonfire:
              return const BonfireView();
            case TabState.chat:
              return const ChatView();
            case TabState.profile:
              return const ProfileView();
          }
        },
      ),
    );
  }
}
