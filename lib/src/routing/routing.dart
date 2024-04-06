// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:bucket_list_bliss/main.dart';
import 'package:bucket_list_bliss/src/utils/observers/routing_observer.dart';

final routeConfig = GoRouter(
  debugLogDiagnostics: true,
  observers: [
    RoutingObserver(),
  ],
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'second',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const SecondScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(
                    animation,
                  ),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
  ],
);
