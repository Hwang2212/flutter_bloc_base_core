import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/common/common.dart';

class SignUpPage extends StatelessWidget with PageNavigateMixin {
  const SignUpPage({super.key});
  @override
  String get goName => 'sign-up-view';

  @override
  String get routeName => goNameWithSlash;

  @override
  Widget build(BuildContext context) {
    return const SignUpView();
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
