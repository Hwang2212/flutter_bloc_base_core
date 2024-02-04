import 'package:flutter/material.dart';
import 'package:wesplit/common/common.dart';
import 'package:wesplit/features/splash/splash.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: const SplashPage(),
    );
  }
}
