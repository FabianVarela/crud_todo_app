import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/ui/todo_category_list_view.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:crud_todo_app/ui/widgets/custom_checkbox.dart';
import 'package:crud_todo_app/ui/widgets/todo_item.dart';
import 'package:crud_todo_app/ui/widgets/todo_item_tile.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  late MockNavigator mockNavigator;

  late MockCategoryService mockCategoryService;
  late ICategoryRepository categoryRepository;

  late MockTodoService mockTodoService;
  late ITodoRepository todoRepository;

  Widget _todoListWithData() {
    return Scaffold(
      body: Consumer(
        builder: (_, ref, __) {
          final todos = ref.watch(todoDataProvider(categoryId));
          if (todos.data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final list = todos.data!.value;
          return Offstage(
            offstage: list.isEmpty,
            child: TodoList(todoList: list, onEditTap: (_) {}),
          );
        },
      ),
    );
  }

  setUpAll(() {
    mockCategoryService = MockCategoryService();
    categoryRepository = CategoryRepository(mockCategoryService);

    mockTodoService = MockTodoService();
    todoRepository = TodoRepository(mockTodoService);
    registerFallbackValue(MyTodoFake());

    mockNavigator = MockNavigator();
    registerFallbackValue(MyRouteFake());
  });

  group('$TodoListView UI screen', () {
    testWidgets('Show $TodoListView screen', (tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: TodoListView(category: category),
        ),
      ));

      expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets(
        'Check back button in $TodoListView screen '
        'and return to $TodoCategoryListView screen', (tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: TodoListView(category: category),
          navigatorObservers: [mockNavigator],
        ),
      ));

      await tester.tap(find.byIcon(Icons.arrow_back_ios));
      await tester.pumpAndSettle();

      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets(
        'Check remove $Category button in $TodoListView screen '
        'and return to $TodoCategoryListView screen', (tester) async {
      late final ICategoryViewModel viewModel;

      when(() => mockCategoryService.deleteCategory(any()))
          .thenAnswer((_) => Future<void>.delayed(const Duration(seconds: 1)));

      await tester.pumpWidget(ProviderScope(
        overrides: [
          categoryRepositoryProvider.overrideWithValue(categoryRepository),
        ],
        child: Consumer(
          builder: (_, ref, child) {
            viewModel = ref.read(categoryViewModelProvider.notifier);
            return child!;
          },
          child: MaterialApp(
            home: TodoListView(category: category),
            navigatorObservers: [mockNavigator],
          ),
        ),
      ));

      expect(viewModel.debugState, isA<CategoryStateInitial>());
      await tester.tap(find.byIcon(Icons.delete));

      verify(() => mockCategoryService.deleteCategory(any())).called(1);

      expect(viewModel.debugState, isA<CategoryStateLoading>());
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();

      expect(viewModel.debugState, isA<CategoryStateSuccess>());
      await tester.pumpAndSettle();

      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets('When remove $Category model set $Exception', (tester) async {
      late final ICategoryViewModel viewModel;

      when(() => mockCategoryService.deleteCategory(any()))
          .thenThrow(Exception('Error'));

      await tester.pumpWidget(ProviderScope(
        overrides: [
          categoryRepositoryProvider.overrideWithValue(categoryRepository),
        ],
        child: Consumer(
          builder: (_, ref, child) {
            viewModel = ref.read(categoryViewModelProvider.notifier);
            return child!;
          },
          child: MaterialApp(home: TodoListView(category: category)),
        ),
      ));

      expect(viewModel.debugState, isA<CategoryStateInitial>());
      await tester.tap(find.byIcon(Icons.delete));

      verify(() => mockCategoryService.deleteCategory(any())).called(1);
      expect(viewModel.debugState, isA<CategoryStateError>());
    });

    testWidgets('Show $TodoListView screen with empty data', (tester) async {
      when(() => mockTodoService.getTodosByCategory(any()))
          .thenAnswer((_) => Stream.value([]));

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

    testWidgets('Show $TodoListView screen with data', (tester) async {
      when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
        (_) => Stream.value([existingTodo]),
      );

      await tester.pumpWidget(ProviderScope(
        overrides: [
          todoRepositoryProvider.overrideWithValue(todoRepository),
        ],
        child: MaterialApp(home: _todoListWithData()),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ListView), findsOneWidget);

      expect(tester.widgetList(find.byType(TodoItem)), [
        isA<TodoItem>()
            .having((w) => w.todo.id, 'id', todoId)
            .having((w) => w.todo.categoryId, 'categoryId', categoryId)
            .having((w) => w.todo.subject, 'subject', todoSubject)
            .having((w) => w.todo.finalDate, 'finalDate', todoFinalDate)
            .having((w) => w.todo.isCompleted, 'isCompleted', false),
      ]);
    });

    testWidgets(
        'Update $Todo model when check '
        'an existing $TodoItem widget', (tester) async {
      when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
        (_) => Stream.value([existingTodo]),
      );

      when(() => mockTodoService.saveTodo(any())).thenAnswer((_) {
        return Future<void>.delayed(const Duration(milliseconds: 100));
      });

      await tester.pumpWidget(ProviderScope(
        overrides: [
          todoRepositoryProvider.overrideWithValue(todoRepository),
        ],
        child: MaterialApp(home: _todoListWithData()),
      ));

      await tester.pumpAndSettle();

      final foundItemList = find.descendant(
        of: find.byType(ListView),
        matching: find.byType(TodoItem),
      );
      expect(foundItemList, findsOneWidget);

      final foundItemCheck = find.descendant(
        of: foundItemList,
        matching: find.byType(CustomCheckbox),
      );
      expect(foundItemCheck, findsOneWidget);

      _expectTileState(tester, foundItemList, TodoItemState.unchecked);
      await tester.tap(foundItemCheck);

      verify(() => mockTodoService.saveTodo(any())).called(1);

      await tester.pump();
      _expectTileState(tester, foundItemList, TodoItemState.loading);

      await tester.pumpAndSettle();
      _expectTileState(tester, foundItemList, TodoItemState.checked);
    });

    testWidgets('When update $Todo model set $Exception', (tester) async {
      when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
        (_) => Stream.value([existingTodo]),
      );

      when(() => mockTodoService.saveTodo(any())).thenAnswer((_) {
        return Future<void>.delayed(
          const Duration(milliseconds: 100),
          () async => throw Exception('Error'),
        );
      });

      await tester.pumpWidget(ProviderScope(
        overrides: [
          todoRepositoryProvider.overrideWithValue(todoRepository),
        ],
        child: MaterialApp(home: _todoListWithData()),
      ));

      await tester.pumpAndSettle();

      final foundItemList = find.descendant(
        of: find.byType(ListView),
        matching: find.byType(TodoItem),
      );
      expect(foundItemList, findsOneWidget);

      final foundItemCheck = find.descendant(
        of: foundItemList,
        matching: find.byType(CustomCheckbox),
      );
      expect(foundItemCheck, findsOneWidget);

      _expectTileState(tester, foundItemList, TodoItemState.unchecked);
      await tester.tap(foundItemCheck);

      verify(() => mockTodoService.saveTodo(any())).called(1);

      await tester.pump();
      _expectTileState(tester, foundItemList, TodoItemState.loading);

      await tester.pumpAndSettle();
      _expectTileState(tester, foundItemList, TodoItemState.unchecked);
    });
  });
}

void _expectTileState(WidgetTester tester, Finder finder, TodoItemState state) {
  final foundItemTile = find.descendant(
    of: finder,
    matching: find.byType(TodoItemTile),
  );

  final _state = tester.widget<TodoItemTile>(foundItemTile).state;
  expect(_state, equals(state));
}
