import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/features/auth/auth.dart';
import 'package:flutter_bloc_base/features/home/home.dart';
import 'package:flutter_bloc_base/features/profile/profile.dart';
import 'package:flutter_bloc_base/features/settings/views/settings_view.dart';
import 'package:flutter_bloc_base/features/splash/splash.dart';
import 'package:flutter_bloc_base/features/tabs/views/tabs_view.dart';
import 'package:flutter_bloc_base/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class AppNavigationHelper {
  static final AppNavigationHelper _instance = AppNavigationHelper._internal();

  static AppNavigationHelper get instance => _instance;

  static late final GoRouter router;

  factory AppNavigationHelper() {
    return _instance;
  }

  /// Instantiate Navigator Keys, espcially BottomNavBar's Navigator Keys
  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> profileTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingsTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  AppNavigationHelper._internal() {
    final routes = [
      GoRoute(
        path: const SplashPage().routeName,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: const TabsPage().routeName,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const TabsPage(
          child: HomePage(),
        ),
      ),

      /// Andy: Bottom Navigation Bar uses [StatefulShellRoute.indexedStack]
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: const HomePage().routeName,
                pageBuilder: (context, state) => getPage(
                  state: state,
                  child: const HomePage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: const ProfilePage().routeName,
                pageBuilder: (context, state) => getPage(
                  state: state,
                  child: const ProfilePage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: const SettingsPage().routeName,
                pageBuilder: (context, state) => getPage(
                  state: state,
                  child: const SettingsPage(),
                ),
              ),
            ],
          ),
        ],
        pageBuilder: (context, state, navigationShell) => getPage(
          child: TabsPage(
            child: navigationShell,
          ),
          state: state,
        ),
      ),

      GoRoute(
        path: const SignInPage().routeName,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: const SignUpPage().routeName,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const SignUpPage(),
      ),
    ];

    router = GoRouter(
      errorBuilder: (context, state) {
        return const _RouterErrorBuilder();
      },
      observers: [
        MyNavigatorObserver(),
        _routeObserver,
      ],
      navigatorKey: parentNavigatorKey,
      initialLocation: const SplashPage().routeName,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}

/// GoRoute Error Redirection Builder:
class _RouterErrorBuilder extends StatefulWidget {
  const _RouterErrorBuilder();

  @override
  State<_RouterErrorBuilder> createState() => _RouterErrorBuilderState();
}

class _RouterErrorBuilderState extends State<_RouterErrorBuilder> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Icon(Icons.error),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).pageNotFoundInvalidLink),
            TextButton(
              onPressed: () => context.go('/'),
              child: Text(S.of(context).goBack),
            ),
          ],
        ),
      ),
    );
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('Push to route: ${route.settings.name}, previous route: ${previousRoute?.settings.name}');
    AppConfig.currentRoute = route.settings.name ?? '';
    log("Current route: ${AppConfig.currentRoute}");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {}
}

final RouteObserver<ModalRoute> _routeObserver = RouteObserver<ModalRoute>();
