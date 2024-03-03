import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/common/common.dart';

class AppConfig {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static var currentRoute = '';

  static Future<void> initaliseApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    AppNavigationHelper.instance;
  }
}
