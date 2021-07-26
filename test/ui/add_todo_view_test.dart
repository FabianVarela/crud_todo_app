import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/ui/add_todo_view.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  group('$AddTodoView UI screen', () {
    late MockTodoService mockTodoService;
    late ITodoRepository todoRepository;

    late MockNavigator mockNavigator;

    setUpAll(() {
      mockTodoService = MockTodoService();
      todoRepository = TodoRepository(mockTodoService);
      registerFallbackValue(MyTodoFake());

      mockNavigator = MockNavigator();
      registerFallbackValue(MyRouteFake());
    });

    Future<void> _pumpMainScreen(WidgetTester tester, Widget child) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          todoRepositoryProvider.overrideWithValue(todoRepository),
        ],
        child: MaterialApp(
          home: child,
          navigatorObservers: [mockNavigator],
        ),
      ));
    }

    testWidgets('Show $AddTodoView screen', (tester) async {
      await _pumpMainScreen(
        tester,
        AddTodoView(category: category, todo: existingTodo),
      );

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
      await _pumpMainScreen(
        tester,
        AddTodoView(category: category, todo: existingTodo),
      );

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets('Show $DatePickerDialog when tap $DateTodo', (tester) async {
      await _pumpMainScreen(
        tester,
        AddTodoView(category: category, todo: existingTodo),
      );

      await tester.tap(find.byType(DateTodo));
      await tester.pump();

      expect(find.byType(CalendarDatePicker), findsOneWidget);
    });

    testWidgets(
        '$AddTodoView show $SubmitTodo disabled when '
        '$SubjectTodo or $DateTodo widgets are empty', (tester) async {
      await _pumpMainScreen(
        tester,
        AddTodoView(category: category, todo: existingTodo),
      );

      final foundSubmitButton = find.byType(SubmitTodo);

      await tester.enterText(find.byType(SubjectTodo), '');
      await tester.pumpAndSettle();

      final enabled = tester.widget<SubmitTodo>(foundSubmitButton).enabled;
      expect(enabled, isFalse);
    });

    testWidgets(
        '$AddTodoView show $SubmitTodo enabled when '
        '$SubjectTodo or $DateTodo widgets are not empty', (tester) async {
      await _pumpMainScreen(
        tester,
        AddTodoView(category: category, todo: existingTodo),
      );

      final foundSubmitButton = find.byType(SubmitTodo);

      await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
      await tester.pumpAndSettle();

      final enabled = tester.widget<SubmitTodo>(foundSubmitButton).enabled;
      expect(enabled, isTrue);
    });

    testWidgets('Add a $Todo model from $AddTodoView', (tester) async {
      late final ITodoViewModel viewModel;

      when(() => mockTodoService.saveTodo(any()))
          .thenAnswer((_) => Future<void>.delayed(const Duration(seconds: 1)));

      await _pumpMainScreen(tester, Consumer(builder: (_, ref, child) {
        viewModel = ref.read(todoViewModelProvider.notifier);
        return AddTodoView(category: category, todo: addingTodo);
      }));

      await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
      await tester.pump();

      expect(viewModel.debugState, isA<TodoStateInitial>());
      await tester.tap(find.byType(SubmitTodo));

      verify(() => mockTodoService.saveTodo(any())).called(1);

      expect(viewModel.debugState, isA<TodoStateLoading>());
      await tester.pump(const Duration(seconds: 1));

      await tester.pumpAndSettle();

      expect(viewModel.debugState, isA<TodoStateSuccess>());
      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets('Update a $Todo model from $AddTodoView', (tester) async {
      late final ITodoViewModel viewModel;

      when(() => mockTodoService.saveTodo(any()))
          .thenAnswer((_) => Future<void>.delayed(const Duration(seconds: 1)));

      await _pumpMainScreen(tester, Consumer(builder: (_, ref, child) {
        viewModel = ref.read(todoViewModelProvider.notifier);
        return AddTodoView(category: category, todo: existingTodo);
      }));

      await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
      await tester.pumpAndSettle();

      expect(viewModel.debugState, isA<TodoStateInitial>());
      await tester.tap(find.byType(SubmitTodo));

      verify(() => mockTodoService.saveTodo(any())).called(1);

      expect(viewModel.debugState, isA<TodoStateLoading>());
      await tester.pump(const Duration(seconds: 1));

      await tester.pumpAndSettle();

      expect(viewModel.debugState, isA<TodoStateSuccess>());
      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets(
        'When add or update a $Todo '
        'model set an $Exception', (tester) async {
      late final ITodoViewModel viewModel;

      when(() => mockTodoService.saveTodo(any())).thenThrow(Exception('Error'));

      await _pumpMainScreen(tester, Consumer(builder: (_, ref, child) {
        viewModel = ref.read(todoViewModelProvider.notifier);
        return AddTodoView(category: category, todo: existingTodo);
      }));

      await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
      await tester.pumpAndSettle();

      expect(viewModel.debugState, isA<TodoStateInitial>());
      await tester.tap(find.byType(SubmitTodo));

      verify(() => mockTodoService.saveTodo(any())).called(1);
      expect(viewModel.debugState, isA<TodoStateError>());
    });
  });
}
