import 'package:context_menus/context_menus.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/navigator/crud_todo_information_parser.dart';
import 'package:crud_todo_app/navigator/crud_todo_router_delegate.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/ui/category_list_view.dart';
import 'package:crud_todo_app/ui/form_todo_view.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:crud_todo_app/ui/widgets/category_item.dart';
import 'package:crud_todo_app/ui/widgets/custom_checkbox.dart';
import 'package:crud_todo_app/ui/widgets/todo_item.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  group('$TodoListView UI screen', () {
    late final MockFirestore mockFirestoreInstance;

    late final MockCategoryService mockCategoryService;
    late final ICategoryRepository categoryRepository;

    late final MockTodoService mockTodoService;
    late final ITodoRepository todoRepository;

    late final CrudTodoRouterDelegate todoRouterDelegate;
    late final CrudTodoInformationParser todoInfoParser;

    late CategoryViewModel categoryViewModel;
    late TodoViewModel todoViewModel;

    setUpAll(() {
      mockFirestoreInstance = MockFirestore();

      mockCategoryService = MockCategoryService();
      categoryRepository = CategoryRepository(mockCategoryService);

      mockTodoService = MockTodoService();
      todoRepository = TodoRepository(mockTodoService);

      registerFallbackValue(MyTodoFake());

      // Using simple Riverpod to test dependencies
      final container = ProviderContainer();

      todoRouterDelegate = container.read(crudTodoRouterDelegateProvider);
      todoInfoParser = container.read(crudTodoInformationParserProvider);
    });

    Future<void> pumpMainScreen(WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebasePod.overrideWithValue(mockFirestoreInstance),
            categoryServicePod.overrideWithValue(mockCategoryService),
            todoServicePod.overrideWithValue(mockTodoService),
            categoryRepositoryPod.overrideWithValue(categoryRepository),
            todoRepositoryPod.overrideWithValue(todoRepository),
          ],
          child: MaterialApp.router(
            routerDelegate: todoRouterDelegate,
            routeInformationParser: todoInfoParser,
            backButtonDispatcher: RootBackButtonDispatcher(),
            builder: (_, child) => Consumer(
              builder: (_, ref, __) {
                categoryViewModel = ref.read(categoryViewModelPod.notifier);
                todoViewModel = ref.read(todoViewModelPod.notifier);

                return child!;
              },
            ),
          ),
        ),
      );
    }

    Future<void> initMainScreenAndRedirect(
      WidgetTester tester, {
      bool hasException = false,
    }) async {
      when(categoryRepository.getCategories).thenAnswer(
        (_) => Stream.value([category]),
      );

      if (hasException) {
        when(() => mockCategoryService.getCategoryById(any())).thenThrow(
          Exception('Category not found'),
        );
      } else {
        when(() => mockCategoryService.getCategoryById(any())).thenAnswer(
          (_) => Future.value(category),
        );
      }

      await pumpMainScreen(tester);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(GridView), findsOneWidget);

      final foundCatItem = find.descendant(
        of: find.byType(GridView),
        matching: find.byType(CategoryItem),
      );
      expect(foundCatItem, findsOneWidget);

      await tester.tap(foundCatItem);
      await tester.pumpAndSettle();

      expect(find.byType(TodoListView), findsOneWidget);
    }

    testWidgets(
      'Show $Exception when get the $Category detail',
      (tester) async {
        await initMainScreenAndRedirect(tester, hasException: true);

        expect(find.byIcon(Icons.delete_forever), findsNothing);
        expect(find.byType(FloatingActionButton), findsNothing);
        expect(find.text('Exception: Category not found'), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show $TodoListView screen with empty data',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([]),
        );

        await initMainScreenAndRedirect(tester);

        expect(find.byIcon(Icons.delete_forever), findsOneWidget);
        expect(find.byType(FloatingActionButton), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show $TodoListView screen with $Todo list data',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([existingTodo]),
        );

        await initMainScreenAndRedirect(tester);

        expect(find.byType(ListView), findsOneWidget);
        expect(tester.widgetList(find.byType(TodoItem)), [
          isA<TodoItem>()
              .having((w) => w.todo.id, 'id', todoId)
              .having((w) => w.todo.categoryId, 'categoryId', categoryId)
              .having((w) => w.todo.subject, 'subject', todoSubject)
              .having((w) => w.todo.finalDate, 'finalDate', todoFinalDate)
              .having((w) => w.todo.isCompleted, 'isCompleted', false),
        ]);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show $TodoListView screen with $Todo list with expired date',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([expiredTodo]),
        );

        await initMainScreenAndRedirect(tester);

        expect(find.byType(ListView), findsOneWidget);
        expect(tester.widgetList(find.byType(TodoItem)), [
          isA<TodoItem>()
              .having((w) => w.todo.id, 'id', todoId)
              .having((w) => w.todo.categoryId, 'categoryId', categoryId)
              .having((w) => w.todo.subject, 'subject', todoSubject)
              .having((w) => w.todo.finalDate, 'finalDate', todoExpiredDate)
              .having((w) => w.todo.isCompleted, 'isCompleted', false),
        ]);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show $TodoListView screen with a $Todo list with current date',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([todayTodo]),
        );

        await initMainScreenAndRedirect(tester);

        expect(find.byType(ListView), findsOneWidget);
        expect(tester.widgetList(find.byType(TodoItem)), [
          isA<TodoItem>()
              .having((w) => w.todo.id, 'id', todoId)
              .having((w) => w.todo.categoryId, 'categoryId', categoryId)
              .having((w) => w.todo.subject, 'subject', todoSubject)
              .having((w) => w.todo.finalDate, 'finalDate', todoTodayDate)
              .having((w) => w.todo.isCompleted, 'isCompleted', false),
        ]);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show $Exception when get $Todo list data',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenThrow(
          Exception('Todo list not found'),
        );

        await initMainScreenAndRedirect(tester);

        expect(find.byIcon(Icons.delete_forever), findsOneWidget);
        expect(find.byType(FloatingActionButton), findsOneWidget);
        expect(find.text('Exception: Todo list not found'), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Redirect to $FormTodoView screen to add new $Todo',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([]),
        );

        await initMainScreenAndRedirect(tester);

        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();

        expect(find.byType(FormTodoView), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'When remove $Category from $TodoListView will be success and return',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([]),
        );
        when(() => mockCategoryService.deleteCategory(any())).thenAnswer(
          (_) => Future<void>.delayed(const Duration(seconds: 1)),
        );

        await initMainScreenAndRedirect(tester);
        await tester.tap(find.byIcon(Icons.delete_forever));

        verify(() => mockCategoryService.deleteCategory(any())).called(1);

        expect(categoryViewModel.debugState.isLoading, isTrue);
        await tester.pump(const Duration(seconds: 1));
        await tester.pumpAndSettle();

        expect(categoryViewModel.debugState.isSuccess, isTrue);
        await tester.pumpAndSettle();

        expect(find.byType(CategoryListView), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'When remove $Category from $TodoListView set an $Exception',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([]),
        );
        when(() => mockCategoryService.deleteCategory(any())).thenThrow(
          Exception('Error'),
        );

        await initMainScreenAndRedirect(tester);
        await tester.tap(find.byIcon(Icons.delete_forever));

        verify(() => mockCategoryService.deleteCategory(any())).called(1);

        expect(categoryViewModel.debugState.isError, isTrue);
        expect(find.byType(CategoryListView), findsNothing);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Updating a $Todo when check a $TodoItem widget',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([existingTodo]),
        );
        when(() => mockTodoService.saveTodo(any())).thenAnswer(
          (_) => Future<void>.delayed(const Duration(milliseconds: 100)),
        );

        await initMainScreenAndRedirect(tester);
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

        await tester.tap(foundItemCheck);
        verify(() => mockTodoService.saveTodo(any())).called(1);

        await tester.pump();
        expect(todoViewModel.debugState.isLoading, isTrue);

        await tester.pumpAndSettle();
        expect(todoViewModel.debugState.isSuccess, isTrue);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'When update a $Todo when check set an $Exception',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([existingTodo]),
        );
        when(() => mockTodoService.saveTodo(any())).thenThrow(
          Exception('Error'),
        );

        await initMainScreenAndRedirect(tester);
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

        await tester.tap(foundItemCheck);
        verify(() => mockTodoService.saveTodo(any())).called(1);

        await tester.pumpAndSettle();
        expect(todoViewModel.debugState.isError, isTrue);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'When slide to the left a $TodoItem, redirect to $FormTodoView screen',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([existingTodo]),
        );

        await initMainScreenAndRedirect(tester);
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

        expect(find.byType(FormTodoView), findsOneWidget);
      },
      variant: TargetPlatformVariant.mobile(),
    );

    testWidgets(
      'When slide to the right a $TodoItem, remove a $Todo from list',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([existingTodo]),
        );
        when(() => mockTodoService.deleteTodo(any(), any())).thenAnswer(
          (_) => Future<void>.delayed(const Duration(milliseconds: 100)),
        );

        await initMainScreenAndRedirect(tester);
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

        await tester.tap(foundSlideAction);
        verify(() => mockTodoService.deleteTodo(any(), any())).called(1);

        expect(todoViewModel.debugState.isLoading, isTrue);
        await tester.pumpAndSettle();

        expect(todoViewModel.debugState.isSuccess, isTrue);
      },
      variant: TargetPlatformVariant.mobile(),
    );

    testWidgets(
      'When slide to the right a $TodoItem, remove but set an $Exception',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([existingTodo]),
        );
        when(() => mockTodoService.deleteTodo(any(), any())).thenThrow(
          Exception('Error'),
        );

        await initMainScreenAndRedirect(tester);
        await tester.pumpAndSettle();

        final foundItemList = find.descendant(
          of: find.byType(ListView),
          matching: find.byType(TodoItem),
        );
        expect(foundItemList, findsOneWidget);

        await tester.drag(foundItemList, const Offset(-600, 0));
        await tester.pump();

        final foundSlideAction = find.byType(SlidableAction);
        expect(foundSlideAction, findsOneWidget);

        await tester.tap(foundSlideAction);
        verify(() => mockTodoService.deleteTodo(any(), any())).called(1);

        expect(todoViewModel.debugState.isError, isTrue);
      },
      variant: TargetPlatformVariant.mobile(),
    );

    testWidgets(
      'Show context menu and edit $TodoItem, redirect to $FormTodoView screen',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([existingTodo]),
        );

        await initMainScreenAndRedirect(tester);
        await tester.pumpAndSettle();

        final foundItemList = find.descendant(
          of: find.byType(ListView),
          matching: find.byType(TodoItem),
        );
        expect(foundItemList, findsOneWidget);

        expect(find.byType(SlidableAction), findsNothing);
        expect(find.byType(ContextMenuRegion), findsOneWidget);

        await tester.tap(foundItemList, buttons: kSecondaryMouseButton);
        await tester.pumpAndSettle();

        final foundEditOption = find.byIcon(Icons.edit);
        expect(foundEditOption, findsOneWidget);

        await tester.tap(foundEditOption);
        await tester.pumpAndSettle();

        expect(foundEditOption, findsNothing);
        expect(find.byType(FormTodoView), findsOneWidget);
      },
      variant: TargetPlatformVariant.desktop(),
    );

    testWidgets(
      'Show context menu and delete $TodoItem',
      (tester) async {
        when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
          (_) => Stream.value([existingTodo]),
        );
        when(() => mockTodoService.deleteTodo(any(), any())).thenAnswer(
          (_) => Future<void>.delayed(const Duration(milliseconds: 100)),
        );

        await initMainScreenAndRedirect(tester);
        await tester.pumpAndSettle();

        final foundItemList = find.descendant(
          of: find.byType(ListView),
          matching: find.byType(TodoItem),
        );
        expect(foundItemList, findsOneWidget);

        expect(find.byType(SlidableAction), findsNothing);
        expect(find.byType(ContextMenuRegion), findsOneWidget);

        await tester.tap(foundItemList, buttons: kSecondaryMouseButton);
        await tester.pumpAndSettle();

        final foundRemoveOption = find.byIcon(Icons.delete);
        expect(foundRemoveOption, findsOneWidget);

        await tester.tap(foundRemoveOption);
        verify(() => mockTodoService.deleteTodo(any(), any())).called(1);

        expect(todoViewModel.debugState.isLoading, isTrue);
        await tester.pumpAndSettle();

        expect(todoViewModel.debugState.isSuccess, isTrue);
        expect(foundRemoveOption, findsNothing);
      },
      variant: TargetPlatformVariant.desktop(),
    );
  });
}
