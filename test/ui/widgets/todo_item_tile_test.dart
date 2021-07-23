import 'package:crud_todo_app/ui/widgets/custom_checkbox.dart';
import 'package:crud_todo_app/ui/widgets/todo_item.dart';
import 'package:crud_todo_app/ui/widgets/todo_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Check $TodoItemTile widget when is not negative', () {
    testWidgets('Check when $TodoItemTile is initial', (tester) async {
      var counter = 0;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: TodoItemTile(
            title: 'title',
            subTitle: 'subtitle',
            isNegative: false,
            state: TodoItemState.unchecked,
            onTap: () => counter++,
          ),
        ),
      ));

      final foundTile = find.byType(TodoItemTile);
      final foundCheck = find.descendant(
        of: foundTile,
        matching: find.byType(CustomCheckbox),
      );

      expectTile(tester, foundCheck, false, false);
      expect(counter, 0);

      await tester.tap(foundCheck);
      await tester.pump();

      expect(counter, 1);
    });

    testWidgets('Check when $TodoItemTile is loading', (tester) async {
      var counter = 0;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: TodoItemTile(
            title: 'title',
            subTitle: 'subtitle',
            isNegative: false,
            state: TodoItemState.loading,
            onTap: () => counter++,
          ),
        ),
      ));

      final foundTile = find.byType(TodoItemTile);
      final foundCheck = find.descendant(
        of: foundTile,
        matching: find.byType(CustomCheckbox),
      );

      expectTile(tester, foundCheck, true, false);
      expect(counter, 0);

      await tester.tap(foundCheck);
      await tester.pump();

      expect(counter, 0);
    });

    testWidgets('Check when $TodoItemTile is success', (tester) async {
      var counter = 0;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: TodoItemTile(
            title: 'title',
            subTitle: 'subtitle',
            isNegative: false,
            state: TodoItemState.checked,
            onTap: () => counter++,
          ),
        ),
      ));

      final foundTile = find.byType(TodoItemTile);
      final foundCheck = find.descendant(
        of: foundTile,
        matching: find.byType(CustomCheckbox),
      );

      expectTile(tester, foundCheck, true, true);
      expect(counter, 0);

      await tester.tap(foundCheck);
      await tester.pump();

      expect(counter, 0);
    });
  });
}

void expectTile(
    WidgetTester tester, Finder finder, bool isChecked, bool isLineThrough) {
  final _isChecked = tester.widget<CustomCheckbox>(finder).value;
  expect(_isChecked, equals(isChecked));

  final findText = find.text('title');
  expect(findText, findsOneWidget);

  final _text = tester.widget<Text>(findText).style?.decoration;
  expect(
    _text,
    equals(isLineThrough ? TextDecoration.lineThrough : null),
  );
}
