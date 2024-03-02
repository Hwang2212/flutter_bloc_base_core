import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/common/core/app_config.dart';
import 'package:flutter_bloc_base/features/auth/auth.dart';
import 'package:flutter_bloc_base/features/home/views/home_view.dart';
import 'package:flutter_bloc_base/features/splash/splash.dart';
import 'package:flutter_bloc_base/generated/l10n.dart';
import 'package:go_router/go_router.dart';

/// Go Router Implementation:
final route = GoRouter(
  errorBuilder: (context, state) {
    return const _RouterErrorBuilder();
  },
  observers: [MyNavigatorObserver(), _routeObserver],
  navigatorKey: AppConfig.navigatorKey,
  initialLocation: const SplashPage().routeName,
  routes: [
    GoRoute(
      path: const SplashPage().routeName,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: const SignInPage().routeName,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: const SignUpPage().routeName,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: const HomePage().routeName,
      builder: (context, state) => const HomePage(),
    ),
  ],
);

/// GoRoute Error Redirection Builder:
class _RouterErrorBuilder extends StatefulWidget {
  const _RouterErrorBuilder();

  @override
  State<_RouterErrorBuilder> createState() => _RouterErrorBuilderState();
}

class _RouterErrorBuilderState extends State<_RouterErrorBuilder> {
  // final _log = Logger("RouterErrorBuilder");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
