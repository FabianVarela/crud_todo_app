import 'package:crud_todo_app/ui/widgets/custom_checkbox.dart';
import 'package:crud_todo_app/ui/widgets/todo_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Check $TodoItemTile widget when is not negative', () {
    testWidgets('Check when $TodoItemTile is initial', (tester) async {
      var counter = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TodoItemTile(
              title: 'title',
              subTitle: 'subtitle',
              isNegative: false,
              isSuccess: false,
              onTap: () => counter++,
            ),
          ),
        ),
      );

      final foundTile = find.byType(TodoItemTile);
      final foundCheck = find.descendant(
        of: foundTile,
        matching: find.byType(CustomCheckbox),
      );

      expectTile(tester, foundCheck);
      expect(counter, 0);

      await tester.tap(foundCheck);
      await tester.pump();

      expect(counter, 1);
    });

    testWidgets('Check when $TodoItemTile is success', (tester) async {
      var counter = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TodoItemTile(
              title: 'title',
              subTitle: 'subtitle',
              isNegative: false,
              isSuccess: true,
              onTap: () => counter++,
            ),
          ),
        ),
      );

      final foundTile = find.byType(TodoItemTile);
      final foundCheck = find.descendant(
        of: foundTile,
        matching: find.byType(CustomCheckbox),
      );

      expectTile(tester, foundCheck, isChecked: true, isLineThrough: true);
      expect(counter, 0);

      await tester.tap(foundCheck);
      await tester.pump();

      expect(counter, 0);
    });
  });
}

void expectTile(
  WidgetTester tester,
  Finder finder, {
  bool isChecked = false,
  bool isLineThrough = false,
}) {
  final isChecked = tester.widget<CustomCheckbox>(finder).value;
  expect(isChecked, equals(isChecked));

  final findText = find.text('title');
  expect(findText, findsOneWidget);

  expect(
    tester.widget<Text>(findText).style?.decoration,
    equals(isLineThrough ? TextDecoration.lineThrough : null),
  );
}
