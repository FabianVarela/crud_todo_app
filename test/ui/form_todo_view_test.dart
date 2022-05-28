import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/ui/form_todo_view.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  group('$FormTodoView UI screen', () {
    late MockCategoryService mockCategoryService;
    late MockTodoService mockTodoService;

    late ICategoryRepository categoryRepository;
    late ITodoRepository todoRepository;

    late MockNavigator mockNavigator;

    setUpAll(() {
      mockCategoryService = MockCategoryService();
      mockTodoService = MockTodoService();

      categoryRepository = CategoryRepository(mockCategoryService);
      todoRepository = TodoRepository(mockTodoService);

      registerFallbackValue(MyTodoFake());

      mockNavigator = MockNavigator();
      registerFallbackValue(MyRouteFake());
    });

    Future<void> _pumpMainScreen(WidgetTester tester, Widget child) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            categoryRepositoryPod.overrideWithValue(categoryRepository),
            todoRepositoryPod.overrideWithValue(todoRepository),
          ],
          child: MaterialApp(
            home: child,
            navigatorObservers: [mockNavigator],
          ),
        ),
      );
    }

    Future<void> _showHideProgress(WidgetTester tester) async {
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      await tester.pump(const Duration(seconds: 1));
    }

    void _setWhenWithGetData({bool withTodo = true}) {
      when(() => mockCategoryService.getCategoryById(any()))
          .thenAnswer((invocation) => Future.value(category));

      if (withTodo) {
        when(() => mockTodoService.getTodoById(any(), any()))
            .thenAnswer((_) => Future.value(existingTodo));
      }
    }

    testWidgets('Show $FormTodoView screen', (tester) async {
      _setWhenWithGetData();

      await _pumpMainScreen(
        tester,
        FormTodoView(categoryId: category.id!, todoId: existingTodo.id),
      );
      await _showHideProgress(tester);

      expect(find.text('Update Task'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byType(SubjectTodo), findsOneWidget);
      expect(find.byType(DateTodo), findsOneWidget);
      expect(find.byType(CategoryTodo), findsOneWidget);
      expect(find.byType(SubmitTodo), findsOneWidget);
    });

    testWidgets('Show $Exception when get $Category detail', (tester) async {
      when(() => mockCategoryService.getCategoryById(any()))
          .thenThrow(Exception('Category not found'));

      await _pumpMainScreen(tester, FormTodoView(categoryId: category.id!));

      expect(find.text('New Task'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byType(SubjectTodo), findsNothing);
      expect(find.byType(DateTodo), findsNothing);
      expect(find.byType(CategoryTodo), findsNothing);
      expect(find.byType(SubmitTodo), findsNothing);
      expect(find.text('Exception: Category not found'), findsOneWidget);
    });

    testWidgets('Show $Exception when get $Todo detail', (tester) async {
      _setWhenWithGetData(withTodo: false);
      when(() => mockTodoService.getTodoById(any(), any()))
          .thenThrow(Exception('Todo not found'));

      await _pumpMainScreen(
        tester,
        FormTodoView(categoryId: category.id!, todoId: existingTodo.id),
      );
      await _showHideProgress(tester);

      expect(find.text('Update Task'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byType(SubjectTodo), findsNothing);
      expect(find.byType(DateTodo), findsNothing);
      expect(find.byType(CategoryTodo), findsNothing);
      expect(find.byType(SubmitTodo), findsNothing);
      expect(find.text('Exception: Todo not found'), findsOneWidget);
    });

    testWidgets(
        'Check close button in $FormTodoView screen '
        'and return to $TodoListView screen', (tester) async {
      await _pumpMainScreen(
        tester,
        FormTodoView(categoryId: category.id!, todoId: existingTodo.id),
      );

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets('Show $DatePickerDialog when tap $DateTodo', (tester) async {
      _setWhenWithGetData();

      await _pumpMainScreen(
        tester,
        FormTodoView(categoryId: category.id!, todoId: existingTodo.id),
      );
      await _showHideProgress(tester);

      await tester.tap(find.byType(DateTodo));
      await tester.pump();

      expect(find.byType(CalendarDatePicker), findsOneWidget);
    });

    testWidgets(
        '$FormTodoView show $SubmitTodo disabled when '
        '$SubjectTodo or $DateTodo widgets are empty', (tester) async {
      _setWhenWithGetData();

      await _pumpMainScreen(
        tester,
        FormTodoView(categoryId: category.id!, todoId: existingTodo.id),
      );
      await _showHideProgress(tester);

      final foundSubmitButton = find.byType(SubmitTodo);

      await tester.enterText(find.byType(SubjectTodo), '');
      await tester.pumpAndSettle();

      final enabled = tester.widget<SubmitTodo>(foundSubmitButton).onSubmit;
      expect(enabled == null, isTrue);
    });

    testWidgets(
        '$FormTodoView show $SubmitTodo enabled when '
        '$SubjectTodo or $DateTodo widgets are not empty', (tester) async {
      _setWhenWithGetData();

      await _pumpMainScreen(
        tester,
        FormTodoView(categoryId: category.id!, todoId: existingTodo.id),
      );
      await _showHideProgress(tester);

      final foundSubmitButton = find.byType(SubmitTodo);

      await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
      await tester.pumpAndSettle();

      final enabled = tester.widget<SubmitTodo>(foundSubmitButton).onSubmit;
      expect(enabled != null, isTrue);
    });

    testWidgets('Add a $Todo model from $FormTodoView', (tester) async {
      late final TodoViewModel viewModel;

      _setWhenWithGetData();
      when(() => mockTodoService.saveTodo(any()))
          .thenAnswer((_) => Future<void>.delayed(const Duration(seconds: 1)));

      await _pumpMainScreen(
        tester,
        Consumer(
          builder: (_, ref, child) {
            viewModel = ref.read(todoViewModelPod.notifier);
            return FormTodoView(categoryId: category.id!);
          },
        ),
      );
      await _showHideProgress(tester);

      await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
      await tester.pump();

      await tester.tap(find.byType(DateTodo));
      await tester.pump();

      final findDatePicker = find.byType(DatePickerDialog);
      expect(findDatePicker, findsOneWidget);

      final finderNext = find.byWidgetPredicate(
        (widget) =>
            widget is IconButton &&
            (widget.tooltip?.startsWith('Next month') ?? false),
      );

      await tester.tap(finderNext);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.tap(find.text('1'));
      await tester.tap(find.text('OK'));

      await tester.pumpAndSettle();
      expect(findDatePicker, findsNothing);

      final findTimePicker = find.byType(Dialog);
      expect(findTimePicker, findsOneWidget);

      final center = tester.getCenter(findTimePicker);
      await tester.tapAt(Offset(center.dx, center.dy - 50.0)); // 12:00 AM

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      expect(findTimePicker, findsNothing);

      final todoSubmit = find.byType(SubmitTodo);
      final button = tester.widget<SubmitTodo>(todoSubmit);

      expect(button.onSubmit != null, true);
      await tester.tap(todoSubmit);

      expect(viewModel.debugState.isLoading, true);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      verify(() => mockTodoService.saveTodo(any())).called(1);
      await tester.pumpAndSettle();

      expect(viewModel.debugState.isSuccess, true);
      // verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets('Show $CupertinoDatePicker in $FormTodoView', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      _setWhenWithGetData();

      await _pumpMainScreen(
        tester,
        Consumer(
          builder: (_, __, child) {
            return FormTodoView(categoryId: category.id!);
          },
        ),
      );
      await _showHideProgress(tester);

      await tester.tap(find.byType(DateTodo));
      await tester.pumpAndSettle();

      final findDatePicker = find.byType(CupertinoDatePicker);
      expect(findDatePicker, findsOneWidget);

      await tester.drag(
        find.text('Today'),
        const Offset(0, -128),
        touchSlopY: 0,
        warnIfMissed: false,
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      await tester.tapAt(const Offset(20, 20));

      await tester.pumpAndSettle();
      expect(findDatePicker, findsNothing);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('Update a $Todo model from $FormTodoView', (tester) async {
      late final TodoViewModel viewModel;

      _setWhenWithGetData();
      when(() => mockTodoService.saveTodo(any()))
          .thenAnswer((_) => Future<void>.delayed(const Duration(seconds: 1)));

      await _pumpMainScreen(
        tester,
        Consumer(
          builder: (_, ref, child) {
            viewModel = ref.read(todoViewModelPod.notifier);
            return FormTodoView(
              categoryId: category.id!,
              todoId: existingTodo.id,
            );
          },
        ),
      );
      await _showHideProgress(tester);

      await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SubmitTodo));

      verify(() => mockTodoService.saveTodo(any())).called(1);

      expect(viewModel.debugState.isLoading, true);
      await tester.pump(const Duration(seconds: 1));

      await tester.pumpAndSettle();

      expect(viewModel.debugState.isSuccess, true);
      // verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets(
        'When add or update a $Todo '
        'model set an $Exception', (tester) async {
      late final TodoViewModel viewModel;

      _setWhenWithGetData();
      when(() => mockTodoService.saveTodo(any())).thenThrow(Exception('Error'));

      await _pumpMainScreen(
        tester,
        Consumer(
          builder: (_, ref, child) {
            viewModel = ref.read(todoViewModelPod.notifier);
            return FormTodoView(
              categoryId: category.id!,
              todoId: existingTodo.id,
            );
          },
        ),
      );
      await _showHideProgress(tester);

      await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SubmitTodo));

      verify(() => mockTodoService.saveTodo(any())).called(1);
      expect(viewModel.debugState.isError, true);
    });
  });
}
