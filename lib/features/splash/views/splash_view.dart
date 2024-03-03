import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/features/tabs/views/tabs_view.dart';
import 'package:flutter_bloc_base/gen/colors.gen.dart';
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
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(seconds: 3),
        () => AppNavigationHelper.router.push(
          const TabsPage().routeName,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Center(
      child: Container(
        width: 205,
        height: 105,
        alignment: Alignment.center,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: ColorName.lightGrayCed4da,
            blurRadius: 10.0,
          ),
        ]),
        child: Card(
          color: ColorName.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            width: 200,
            height: 100,
            child: Text(
              S.of(context).flutter_bloc_base,
              style:
                  getBoldStyle(color: ColorName.white, fontSize: FontSize.s20),
            ),
          ),
        ),
      ),
    ));
  }
}
