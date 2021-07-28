import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/ui/add_todo_view.dart';
import 'package:crud_todo_app/ui/todo_category_list_view.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:crud_todo_app/ui/widgets/custom_checkbox.dart';
import 'package:crud_todo_app/ui/widgets/todo_item.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  group('$TodoListView UI screen', () {
    late MockCategoryService mockCategoryService;
    late ICategoryRepository categoryRepository;

    late MockTodoService mockTodoService;
    late ITodoRepository todoRepository;

    late MockNavigator mockNavigator;

    setUpAll(() {
      mockCategoryService = MockCategoryService();
      categoryRepository = CategoryRepository(mockCategoryService);

      mockTodoService = MockTodoService();
      todoRepository = TodoRepository(mockTodoService);
      registerFallbackValue(MyTodoFake());

      mockNavigator = MockNavigator();
      registerFallbackValue(MyRouteFake());
    });

    Future<void> _pumpMainScreen(WidgetTester tester, Widget child) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          categoryRepositoryProvider.overrideWithValue(categoryRepository),
          todoRepositoryProvider.overrideWithValue(todoRepository),
        ],
        child: MaterialApp(
          home: child,
          navigatorObservers: [mockNavigator],
        ),
      ));
    }

    testWidgets('Show $TodoListView screen', (tester) async {
      await _pumpMainScreen(tester, TodoListView(category: category));

      expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
      expect(find.byIcon(Icons.delete_forever), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets(
        'Check back button in $TodoListView screen '
        'and return to $TodoCategoryListView screen', (tester) async {
      await _pumpMainScreen(tester, TodoListView(category: category));

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

      final mainScreenConsumer = Consumer(builder: (_, ref, child) {
        viewModel = ref.read(categoryViewModelProvider.notifier);
        return TodoListView(category: category);
      });

      await _pumpMainScreen(tester, mainScreenConsumer);

      expect(viewModel.debugState, isA<CategoryStateInitial>());
      await tester.tap(find.byIcon(Icons.delete_forever));

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

      final mainScreenConsumer = Consumer(builder: (_, ref, child) {
        viewModel = ref.read(categoryViewModelProvider.notifier);
        return TodoListView(category: category);
      });

      await _pumpMainScreen(tester, mainScreenConsumer);

      expect(viewModel.debugState, isA<CategoryStateInitial>());
      await tester.tap(find.byIcon(Icons.delete_forever));

      verify(() => mockCategoryService.deleteCategory(any())).called(1);
      expect(viewModel.debugState, isA<CategoryStateError>());
      verifyNoMoreInteractions(mockCategoryService);
    });

    testWidgets('Show $TodoListView screen with empty data', (tester) async {
      when(() => mockTodoService.getTodosByCategory(any()))
          .thenAnswer((_) => Stream.value([]));

      await _pumpMainScreen(tester, TodoListView(category: category));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Empty data, add a task'), findsOneWidget);
    });

    testWidgets('Show $TodoListView screen with data', (tester) async {
      when(() => mockTodoService.getTodosByCategory(any()))
          .thenAnswer((_) => Stream.value([existingTodo]));

      await _pumpMainScreen(tester, TodoListView(category: category));

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
      late final ITodoViewModel viewModel;

      when(() => mockTodoService.getTodosByCategory(any()))
          .thenAnswer((_) => Stream.value([existingTodo]));

      when(() => mockTodoService.saveTodo(any())).thenAnswer((_) {
        return Future<void>.delayed(const Duration(milliseconds: 100));
      });

      final mainScreenConsumer = Consumer(builder: (_, ref, child) {
        viewModel = ref.read(todoViewModelProvider.notifier);
        return TodoListView(category: category);
      });

      await _pumpMainScreen(tester, mainScreenConsumer);
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

      expect(viewModel.debugState, isA<TodoStateInitial>());
      await tester.tap(foundItemCheck);

      verify(() => mockTodoService.saveTodo(any())).called(1);

      await tester.pump();
      expect(viewModel.debugState, isA<TodoStateLoading>());

      await tester.pumpAndSettle();
      expect(viewModel.debugState, isA<TodoStateSuccess>());
    });

    testWidgets('When update $Todo model set $Exception', (tester) async {
      late ITodoViewModel viewModel;

      when(() => mockTodoService.getTodosByCategory(any()))
          .thenAnswer((_) => Stream.value([existingTodo]));

      when(() => mockTodoService.saveTodo(any())).thenAnswer((_) {
        return Future<void>.delayed(
          const Duration(milliseconds: 100),
          () async => throw Exception('Error'),
        );
      });

      final mainScreenConsumer = Consumer(builder: (_, ref, child) {
        viewModel = ref.read(todoViewModelProvider.notifier);
        return TodoListView(category: category);
      });

      await _pumpMainScreen(tester, mainScreenConsumer);
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

      expect(viewModel.debugState, isA<TodoStateInitial>());
      await tester.tap(foundItemCheck);

      verify(() => mockTodoService.saveTodo(any())).called(1);

      await tester.pump();
      expect(viewModel.debugState, isA<TodoStateLoading>());

      await tester.pumpAndSettle();
      expect(viewModel.debugState, isA<TodoStateError>());
    });

    testWidgets(
        'Slide a $TodoItem and go to '
        'edit $Todo in $AddTodoView screen', (tester) async {
      when(() => mockTodoService.getTodosByCategory(any()))
          .thenAnswer((_) => Stream.value([existingTodo]));

      await _pumpMainScreen(tester, TodoListView(category: category));
      await tester.pumpAndSettle();

      final foundItemList = find.descendant(
        of: find.byType(ListView),
        matching: find.byType(TodoItem),
      );
      expect(foundItemList, findsOneWidget);

      final foundSlideAction = find.byType(SlidableAction);
      expect(foundSlideAction, findsNothing);

      await tester.drag(foundItemList, const Offset(600, 0));
      await tester.pump();
      await tester.ensureVisible(foundSlideAction);

      expect(foundSlideAction, findsOneWidget);
      expect(find.byIcon(Icons.edit), findsOneWidget);

      await tester.tap(foundSlideAction);
      await tester.pumpAndSettle();

      verify(() => mockNavigator.didPush(any(), any()));
      expect(find.byType(AddTodoView), findsOneWidget);
    });

    testWidgets('Slide a $TodoItem and remove $Todo from list', (tester) async {
      late ITodoViewModel viewModel;

      when(() => mockTodoService.getTodosByCategory(any()))
          .thenAnswer((_) => Stream.value([existingTodo]));

      when(() => mockTodoService.deleteTodo(any(), any())).thenAnswer((_) {
        return Future<void>.delayed(const Duration(milliseconds: 100));
      });

      final mainScreenConsumer = Consumer(builder: (_, ref, child) {
        viewModel = ref.read(todoViewModelProvider.notifier);
        return TodoListView(category: category);
      });

      await _pumpMainScreen(tester, mainScreenConsumer);
      await tester.pumpAndSettle();

      final foundItemList = find.descendant(
        of: find.byType(ListView),
        matching: find.byType(TodoItem),
      );
      expect(foundItemList, findsOneWidget);

      final foundSlideAction = find.byType(SlidableAction);
      expect(foundSlideAction, findsNothing);

      await tester.drag(foundItemList, const Offset(-600, 0));
      await tester.pump();

      expect(foundSlideAction, findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);

      expect(viewModel.debugState, isA<TodoStateInitial>());
      await tester.tap(foundSlideAction);

      verify(() => mockTodoService.deleteTodo(any(), any())).called(1);

      expect(viewModel.debugState, isA<TodoStateLoading>());
      await tester.pumpAndSettle();

      expect(viewModel.debugState, isA<TodoStateSuccess>());
      expect(foundSlideAction, findsNothing);
    });
  });
}
