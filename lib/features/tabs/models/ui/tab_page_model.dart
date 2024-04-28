import 'package:flutter/widgets.dart';

class TabPageModel {
  TabPageModel({
    required this.key,
    required this.page,
  });

  final GlobalKey<NavigatorState> key;
  final Widget page;
}
