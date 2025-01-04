import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroll/presentation/screens/home/view.dart';
import 'package:stroll/theme/theme.dart';
import 'package:stroll/utils/context.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    GlobalContext().setContext(context);
    return MaterialApp(
      title: 'Stroll',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeView(),
    );
  }
}
