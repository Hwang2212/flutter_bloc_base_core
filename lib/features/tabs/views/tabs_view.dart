import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/features/home/home.dart';
import 'package:flutter_bloc_base/features/user/user.dart';
import 'package:flutter_bloc_base/features/tabs/tabs.dart';

class TabsPage extends StatelessWidget with PageNavigateMixin {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => TabsBloc(),
      ),
    ], child: const TabsView());
  }

  @override
  String get goName => 'tab-view';

  @override
  String get routeName => goNameWithSlash;
}

class TabsView extends StatefulWidget {
  static final tabPages = [
    TabPageModel(
      key: GlobalKey<NavigatorState>(),
      page: const HomePage(),
    ),
    TabPageModel(
      key: GlobalKey<NavigatorState>(),
      page: const ProfilePage(),
    ),
  ];
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsBloc, TabsState>(builder: (context, state) {
      return AppScaffold(
        body: _buildMainBody(state.currentTab.index),
      );
    });
  }

  Widget _buildMainBody(int currentTabIndex) {
    return IndexedStack(
      index: currentTabIndex,
      children: TabsView.tabPages.map((tabPage) {
        return Navigator(
          key: tabPage.key,
          onGenerateRoute: (settings) {
            return MaterialPageRoute<void>(
              builder: (_) {
                return tabPage.page;
              },
              settings: settings,
            );
          },
        );
      }).toList(),
    );
  }
}
