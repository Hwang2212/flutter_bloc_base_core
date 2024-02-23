import 'package:flutter/material.dart';
import 'package:wesplit/features/home/views/home_view.dart';
import 'package:wesplit/features/splash/splash.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    String? routeName;
    debugPrint("[RouteGenerator] ${settings.name}");
    switch (settings.name) {
      case SplashPage.routeName:
        routeName = SplashPage.routeName;
        builder = (_) => const SplashPage();
        break;

      case HomePage.routeName:
        routeName = HomePage.routeName;
        builder = (_) => const HomePage();
        break;

      default:
        throw UnimplementedError();
    }
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: builder);
  }
}
