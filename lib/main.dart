// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:bucket_list_bliss/common/provider_observer.dart';
import 'package:bucket_list_bliss/config/theme/theme.dart';

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

    return MaterialApp(
      title: 'Bucket List Bliss',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return Scaffold(
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
        child: Text(
          'Current theme mode is "${themeMode.name.toUpperCase()}"',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
