import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/ui/add_todo_view.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  late MockNavigator mockNavigator;

  late MockTodoService mockTodoService;
  late ITodoRepository todoRepository;

  setUpAll(() {
    mockTodoService = MockTodoService();
    todoRepository = TodoRepository(mockTodoService);

    mockNavigator = MockNavigator();
    registerFallbackValue(MyRouteFake());
  });

  group('$AddTodoView UI screen', () {
    testWidgets('Show $AddTodoView screen', (tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: AddTodoView(category: category, todo: existingTodo),
        ),
      ));

      expect(find.text('New Task'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byType(SubjectTodo), findsOneWidget);
      expect(find.byType(DateTodo), findsOneWidget);
      expect(find.byType(CategoryTodo), findsOneWidget);
      expect(find.byType(SubmitTodo), findsOneWidget);
    });

    testWidgets(
        'Check close button in $AddTodoView screen '
        'and return to $TodoListView screen', (tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: AddTodoView(category: category, todo: existingTodo),
          navigatorObservers: [mockNavigator],
        ),
      ));

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets('Show $DatePickerDialog when tap $DateTodo', (tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: AddTodoView(category: category, todo: existingTodo),
        ),
      ));

      await tester.tap(find.byType(DateTodo));
      await tester.pump();

      expect(find.byType(CalendarDatePicker), findsOneWidget);
    });

    testWidgets(
        '$AddTodoView show $SubmitTodo disabled when '
        '$SubjectTodo or $DateTodo widgets are empty', (tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: AddTodoView(category: category, todo: initialTodo),
        ),
      ));

      final foundSubmitButton = find.byType(SubmitTodo);

      await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
      await tester.pumpAndSettle();

      final enabled = tester.widget<SubmitTodo>(foundSubmitButton).enabled;
      expect(enabled, isFalse);
    });

    testWidgets(
        '$AddTodoView show $SubmitTodo enabled when '
        '$SubjectTodo or $DateTodo widgets are not empty', (tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: AddTodoView(category: category, todo: existingTodo),
        ),
      ));

      final foundSubmitButton = find.byType(SubmitTodo);

      await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
      await tester.pumpAndSettle();

      final enabled = tester.widget<SubmitTodo>(foundSubmitButton).enabled;
      expect(enabled, isTrue);
    });
  });
}
