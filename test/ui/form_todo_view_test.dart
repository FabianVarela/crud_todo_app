import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/navigator/crud_todo_information_parser.dart';
import 'package:crud_todo_app/navigator/crud_todo_router_delegate.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/ui/form_todo_view.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:crud_todo_app/ui/widgets/category_item.dart';
import 'package:crud_todo_app/ui/widgets/todo_item.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  group('$FormTodoView UI screen', () {
    late final MockFirestore mockFirestoreInstance;

    late final MockCategoryService mockCategoryService;
    late final ICategoryRepository categoryRepository;

    late final MockTodoService mockTodoService;
    late final ITodoRepository todoRepository;

    late final CrudTodoRouterDelegate todoRouterDelegate;
    late final CrudTodoInformationParser todoInfoParser;

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
                todoViewModel = ref.read(todoViewModelPod.notifier);
                return child!;
              },
            ),
          ),
        ),
      );
    }

    Future<void> initScreensAndRedirect(
      WidgetTester tester, {
      bool isNew = false,
    }) async {
      when(categoryRepository.getCategories).thenAnswer(
        (_) => Stream.value([category]),
      );
      when(() => mockCategoryService.getCategoryById(any())).thenAnswer(
        (_) => Future.value(category),
      );
      when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
        (_) => Stream.value([existingTodo]),
      );

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

      final foundItemList = find.descendant(
        of: find.byType(ListView),
        matching: find.byType(TodoItem),
      );
      expect(foundItemList, findsOneWidget);

      if (isNew) {
        await tester.tap(find.byType(FloatingActionButton));
      } else {
        final mobilePlatforms = [
          TargetPlatform.android,
          TargetPlatform.iOS,
          TargetPlatform.fuchsia,
        ];

        if (mobilePlatforms.contains(foundation.defaultTargetPlatform)) {
          final foundSlideAction = find.byType(SlidableAction);
          expect(foundSlideAction, findsNothing);

          await tester.drag(foundItemList, const Offset(600, 0));
          await tester.pump();
          await tester.ensureVisible(foundSlideAction);

          expect(foundSlideAction, findsOneWidget);
          expect(find.byIcon(Icons.edit), findsOneWidget);

          await tester.tap(foundSlideAction);
        } else {
          await tester.tap(foundItemList, buttons: kSecondaryMouseButton);
          await tester.pumpAndSettle();

          final foundEditOption = find.byIcon(Icons.edit);
          expect(foundEditOption, findsOneWidget);

          await tester.tap(foundEditOption);
        }
      }

      await tester.pumpAndSettle();
      expect(find.byType(FormTodoView), findsOneWidget);
    }

    testWidgets(
      'Show $FormTodoView screen',
      (tester) async {
        when(() => mockTodoService.getTodoById(any(), any())).thenAnswer(
          (_) => Future.value(existingTodo),
        );

        await initScreensAndRedirect(tester);

        expect(find.text('Update Task'), findsOneWidget);
        expect(find.byIcon(Icons.close), findsOneWidget);
        expect(find.byType(SubjectTodo), findsOneWidget);
        expect(find.byType(DateTodo), findsOneWidget);
        expect(find.byType(CategoryTodo), findsOneWidget);
        expect(find.byType(SubmitTodo), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Check close button in $FormTodoView screen and return',
      (tester) async {
        await initScreensAndRedirect(tester);

        await tester.tap(find.byIcon(Icons.close));
        await tester.pumpAndSettle();

        expect(find.byType(TodoListView), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show $Exception when get $Todo detail',
      (tester) async {
        when(() => mockTodoService.getTodoById(any(), any())).thenThrow(
          Exception('Todo not found'),
        );

        await initScreensAndRedirect(tester);

        expect(find.text('Update Task'), findsOneWidget);
        expect(find.byIcon(Icons.close), findsOneWidget);

        expect(find.byType(SubjectTodo), findsNothing);
        expect(find.byType(DateTodo), findsNothing);
        expect(find.byType(CategoryTodo), findsNothing);
        expect(find.byType(SubmitTodo), findsNothing);

        expect(find.text('Exception: Todo not found'), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show $DatePickerDialog when tap $DateTodo',
      (tester) async {
        when(() => mockTodoService.getTodoById(any(), any())).thenAnswer(
          (_) => Future.value(existingTodo),
        );

        await initScreensAndRedirect(tester);

        await tester.tap(find.byType(DateTodo));
        await tester.pump();

        expect(find.byType(CalendarDatePicker), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(
        excluding: {TargetPlatform.iOS, TargetPlatform.macOS},
      ),
    );

    testWidgets(
      'Show $SubmitTodo disabled when $SubjectTodo or $DateTodo are empty',
      (tester) async {
        when(() => mockTodoService.getTodoById(any(), any())).thenAnswer(
          (_) => Future.value(existingTodo),
        );

        await initScreensAndRedirect(tester);

        final foundSubmitButton = find.byType(SubmitTodo);

        await tester.enterText(find.byType(SubjectTodo), '');
        await tester.pumpAndSettle();

        final enabled = tester.widget<SubmitTodo>(foundSubmitButton).onSubmit;
        expect(enabled == null, isTrue);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show $SubmitTodo enabled when $SubjectTodo or $DateTodo are not empty',
      (tester) async {
        when(() => mockTodoService.getTodoById(any(), any())).thenAnswer(
          (_) => Future.value(existingTodo),
        );

        await initScreensAndRedirect(tester);

        final foundSubmitButton = find.byType(SubmitTodo);

        await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
        await tester.pumpAndSettle();

        final enabled = tester.widget<SubmitTodo>(foundSubmitButton).onSubmit;
        expect(enabled != null, isTrue);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Add a $Todo model from $FormTodoView',
      (tester) async {
        when(() => mockTodoService.saveTodo(any())).thenAnswer(
          (_) => Future<void>.delayed(const Duration(seconds: 1)),
        );

        await initScreensAndRedirect(tester, isNew: true);

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
        expect(tester.widget<SubmitTodo>(todoSubmit).onSubmit != null, isTrue);

        await tester.tap(todoSubmit);
        verify(() => mockTodoService.saveTodo(any())).called(1);

        await tester.pump();
        expect(todoViewModel.debugState.isLoading, isTrue);

        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(todoViewModel.debugState.isSuccess, isTrue);

        await tester.pump();
        expect(find.byType(TodoListView), findsOneWidget);
      },
      // TODO(FV): Review linux and windows
      variant: const TargetPlatformVariant(
        {TargetPlatform.android, TargetPlatform.fuchsia},
      ),
    );

    testWidgets(
      'Show $CupertinoDatePicker in $FormTodoView',
      (tester) async {
        when(() => mockTodoService.getTodoById(any(), any())).thenAnswer(
          (_) => Future.value(existingTodo),
        );

        await initScreensAndRedirect(tester);

        await tester.tap(find.byType(DateTodo));
        await tester.pumpAndSettle();

        final findDatePicker = find.byType(CupertinoDatePicker);
        expect(findDatePicker, findsOneWidget);

        // await tester.drag(
        //   find.text('Today'),
        //   const Offset(0, -128),
        //   touchSlopY: 0,
        //   warnIfMissed: false,
        // );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));

        await tester.tapAt(const Offset(20, 20));

        await tester.pumpAndSettle();
        expect(findDatePicker, findsNothing);
      },
      variant: const TargetPlatformVariant(
        {TargetPlatform.iOS, TargetPlatform.macOS},
      ),
    );

    testWidgets(
      'Update a $Todo model from $FormTodoView',
      (tester) async {
        when(() => mockTodoService.getTodoById(any(), any())).thenAnswer(
          (_) => Future.value(existingTodo),
        );
        when(() => mockTodoService.saveTodo(any())).thenAnswer(
          (_) => Future<void>.delayed(const Duration(seconds: 1)),
        );

        await initScreensAndRedirect(tester);

        await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
        await tester.pumpAndSettle();

        await tester.tap(find.byType(SubmitTodo));
        verify(() => mockTodoService.saveTodo(any())).called(1);

        await tester.pump();
        expect(todoViewModel.debugState.isLoading, isTrue);

        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(todoViewModel.debugState.isSuccess, isTrue);

        await tester.pump();
        expect(find.byType(TodoListView), findsOneWidget);
      },
      // TODO(FV): Review linux macOS, and windows
      variant: const TargetPlatformVariant(
        {TargetPlatform.android, TargetPlatform.iOS, TargetPlatform.fuchsia},
      ),
    );

    testWidgets(
      'When add or update a $Todo model set an $Exception',
      (tester) async {
        when(() => mockTodoService.getTodoById(any(), any())).thenAnswer(
          (_) => Future.value(existingTodo),
        );
        when(() => mockTodoService.saveTodo(any())).thenThrow(
          Exception('Error'),
        );

        await initScreensAndRedirect(tester);

        await tester.enterText(find.byType(SubjectTodo), 'Test TODO');
        await tester.pumpAndSettle();

        await tester.tap(find.byType(SubmitTodo));

        verify(() => mockTodoService.saveTodo(any())).called(1);
        expect(todoViewModel.debugState.isError, isTrue);

        expect(find.byType(TodoListView), findsNothing);
      },
      variant: TargetPlatformVariant.all(),
    );
  });
}
