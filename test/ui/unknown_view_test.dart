import 'package:crud_todo_app/ui/unknown_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../test_utils/mocks.dart';

void main() {
  late MockNavigator mockNavigator;

  setUpAll(() {
    mockNavigator = MockNavigator();
  });

  Future<void> pumpMainScreen(WidgetTester tester, Widget child) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: child, navigatorObservers: [mockNavigator]),
      ),
    );
  }

  group('$UnknownView UI screen', () {
    testWidgets('Show $UnknownView screen', (tester) async {
      await pumpMainScreen(tester, const UnknownView());

      expect(find.text('Not found'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.textContaining('Screen not found'), findsOneWidget);
    });
  });
}
