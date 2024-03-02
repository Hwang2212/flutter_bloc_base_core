import 'package:flutter/material.dart';

class AppConfig {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static var currentRoute = '';

  static Future<void> initaliseApp() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
