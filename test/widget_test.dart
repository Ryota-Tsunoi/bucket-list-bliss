// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:bucket_list_bliss/main.dart';

void main() {
  testWidgets('Theme mode toggle smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: AppRoot(),
      ),
    );

    expect(find.byIcon(Icons.brightness_4), findsOneWidget);
    expect(find.textContaining('LIGHT'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.brightness_4));
    await tester.pump();

    expect(find.textContaining('DARK'), findsOneWidget);
  });
}
