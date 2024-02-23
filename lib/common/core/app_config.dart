import 'package:flutter/material.dart';

class AppConfig {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> initaliseApp() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
