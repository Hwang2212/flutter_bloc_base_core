import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/common/common.dart';

class SignInPage extends StatelessWidget with PageNavigateMixin {
  const SignInPage({super.key});
  @override
  String get goName => 'sign-in-view';

  @override
  String get routeName => goNameWithSlash;

  @override
  Widget build(BuildContext context) {
    return const SignInView();
  }
}

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
