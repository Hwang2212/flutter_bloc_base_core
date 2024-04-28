import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/common/common.dart';

class HomePage extends StatelessWidget with PageNavigateMixin {
  @override
  String get goName => 'home-view';
  @override
  String get routeName => goNameWithSlash;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.l10n.home,
                  style: getExtraBoldStyle(fontSize: FontSize.s30),
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
