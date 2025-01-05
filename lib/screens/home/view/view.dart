import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll/screens/home/view/home_page.dart';
import 'package:stroll/screens/home/view_model/home_cubit.dart';

export 'card_view.dart';
export 'bonfire_view.dart';
export 'chat_view.dart';
export 'profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeViewModel(),
      child: const HomeScreen(),
    );
  }
}
