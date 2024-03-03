import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/features/tabs/tabs.dart';
import 'package:go_router/go_router.dart';

class TabsPage extends StatelessWidget with PageNavigateMixin {
  final StatefulNavigationShell? child;
  const TabsPage({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => TabsBloc(),
          ),
        ],
        child: TabsView(
          child: child,
        ));
  }

  @override
  String get goName => 'tab-view';

  @override
  String get routeName => goNameWithSlash;
}

class TabsView extends StatefulWidget {
  final StatefulNavigationShell? child;

  const TabsView({super.key, this.child});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: widget.child ?? Container(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.child?.currentIndex ?? 0,
        onTap: (index) {
          widget.child?.goBranch(
            index,
            initialLocation: index == widget.child?.currentIndex,
          );
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'profile',
            icon: Icon(
              Icons.people,
            ),
          ),
          BottomNavigationBarItem(
            label: 'settings',
            icon: Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
    );
  }
}
