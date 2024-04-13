import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/features/home/home.dart';
import 'package:flutter_bloc_base/features/profile/profile.dart';
import 'package:flutter_bloc_base/features/settings/settings.dart';
import 'package:flutter_bloc_base/features/tabs/tabs.dart';

class TabsPage extends StatelessWidget with PageNavigateMixin {
  final Widget? child;
  const TabsPage({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => TabsCubit(),
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
  final Widget? child;

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: context.watch<TabsCubit>().state,
          onTap: (index) {
            // Andy Dev: Not Only we have to navigate to Go Route,
            // TabsCubit must be update as well.
            switch (index) {
              case 0:
                context.goRoute.go(const HomePage().routeName);
                context.read<TabsCubit>().update(0);
                break;
              case 1:
                context.goRoute.go(const ProfilePage().routeName);
                context.read<TabsCubit>().update(1);

                break;
              case 2:
                context.goRoute.go(const SettingsPage().routeName);
                context.read<TabsCubit>().update(2);

                break;
              default:
            }
          },
          items: [
            BottomNavigationBarItem(
              label: context.l10n.home,
              icon: const Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: context.l10n.profile,
              icon: const Icon(
                Icons.people,
              ),
            ),
            BottomNavigationBarItem(
              label: context.l10n.settings,
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
