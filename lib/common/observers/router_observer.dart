// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:logger/logger.dart';

class RouterObserver extends NavigatorObserver {
  final logger = Logger();
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final previousRouteName = previousRoute?.settings.name;
    final currentRouteName = route.settings.name;
    logger.i('Route didPush: $previousRouteName to $currentRouteName');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final previousRouteName = previousRoute?.settings.name;
    final currentRouteName = route.settings.name;
    logger.i('Route didPop: $currentRouteName to $previousRouteName');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final currentRouteName = route.settings.name;
    logger.i('Route didRemove: $currentRouteName');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final oldRouteName = oldRoute?.settings.name;
    final newRouteName = newRoute?.settings.name;
    logger.i('Route didReplace: $oldRouteName to $newRouteName');
  }
}
