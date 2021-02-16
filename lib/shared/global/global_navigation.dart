import 'package:flutter/material.dart';

class GlobalNavigation {
  static final GlobalNavigation instance = GlobalNavigation();

  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
}
