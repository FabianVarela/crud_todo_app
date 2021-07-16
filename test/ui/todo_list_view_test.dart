import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/ui/widgets/todo_item.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import '../service/services_factory.mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  late MockTodoService mockTodoService;
  late ITodoRepository todoRepository;

  setUpAll(() {
    mockTodoService = MockTodoService();
    todoRepository = TodoRepository(mockTodoService);
  });

  group('Todo list view UI', () {
    testWidgets('Show empty data in todo', (WidgetTester tester) async {
      when(mockTodoService.getTodosByCategory(any)).thenAnswer(
        (_) => Stream.value([]),
      );

      await tester.pumpWidget(ProviderScope(
        overrides: [
          todoRepositoryProvider.overrideWithValue(todoRepository),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (_, ref, __) {
                final todos = ref.watch(todoDataProvider(categoryId));
                if (todos.data == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                return todos.data!.value.isEmpty
                    ? const Center(child: Text('Empty data'))
                    : const Offstage();
              },
            ),
          ),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Empty data'), findsOneWidget);
    });

    testWidgets('Show data in todo', (WidgetTester tester) async {
      when(mockTodoService.getTodosByCategory(any)).thenAnswer(
        (_) => Stream.value([todo]),
      );

      await tester.pumpWidget(ProviderScope(
        overrides: [
          todoRepositoryProvider.overrideWithValue(todoRepository),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (_, ref, __) {
                final todos = ref.watch(todoDataProvider(categoryId));
                if (todos.data == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                final list = todos.data!.value;
                return list.isNotEmpty
                    ? ListView(children: <Widget>[
                        for (final item in list)
                          TodoItem(item: item, category: category)
                      ])
                    : const Offstage();
              },
            ),
          ),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(tester.widgetList(find.byType(TodoItem)), [
        isA<TodoItem>()
            .having((w) => w.item.id, 'id', todoId)
            .having((w) => w.item.categoryId, 'categoryId', categoryId)
            .having((w) => w.item.subject, 'subject', todoSubject)
            .having((w) => w.item.finalDate, 'finalDate', todoFinalDate)
            .having((w) => w.item.isCompleted, 'isCompleted', false),
      ]);
    });
  });
}
