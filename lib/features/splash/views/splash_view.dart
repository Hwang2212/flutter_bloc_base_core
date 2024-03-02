import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/generated/l10n.dart';

class SplashPage extends StatelessWidget with PageNavigateMixin {
  @override
  String get goName => '';

  @override
  String get routeName => goNameWithSlash;

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(S.of(context).hi),
    ));
  }
}
