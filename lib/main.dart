// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:bucket_list_bliss/src/common_widgets/scaffold.dart';
import 'package:bucket_list_bliss/src/routing/routing.dart';
import 'package:bucket_list_bliss/src/theme/theme.dart';
import 'package:bucket_list_bliss/src/utils/observers/provider_observer.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        AppObserver(),
      ],
      child: const AppRoot(),
    ),
  );
}

class AppRoot extends ConsumerWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Bucket List Bliss',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routerConfig: routeConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return SelectableScaffold(
      appBar: AppBar(
        title: const Text('Bucket List Bliss'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggle();
            },
            icon: const Icon(Icons.brightness_4),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current theme mode is "${themeMode.name.toUpperCase()}"',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/sign-in');
              },
              child: const Text('Go to Sign-in Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectableScaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Second Screen',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Go to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
