import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/navigator/crud_todo_information_parser.dart';
import 'package:crud_todo_app/navigator/crud_todo_router_delegate.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/ui/form_category_view.dart';
import 'package:crud_todo_app/ui/widgets/custom_mouse_region.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';

void main() {
  group('$FormCategoryView UI dialog', () {
    late final MockFirestore mockFirestoreInstance;

    late final MockCategoryService mockCategoryService;
    late final ICategoryRepository categoryRepository;

    late final CrudTodoRouterDelegate todoRouterDelegate;
    late final CrudTodoInformationParser todoInfoParser;

    late CategoryViewModel categoryViewModel;

    setUpAll(() {
      mockFirestoreInstance = MockFirestore();

      mockCategoryService = MockCategoryService();
      categoryRepository = CategoryRepository(mockCategoryService);
      registerFallbackValue(MyCategoryFake());

      // Using simple Riverpod to test dependencies
      final container = ProviderContainer();

      todoRouterDelegate = container.read(crudTodoRouterDelegateProvider);
      todoInfoParser = container.read(crudTodoInformationParserProvider);
    });

    Future<void> pumpMainScreen(WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebaseProvider.overrideWithValue(mockFirestoreInstance),
            categoryServiceProvider.overrideWithValue(mockCategoryService),
            categoryRepositoryProvider.overrideWithValue(categoryRepository),
          ],
          child: MaterialApp.router(
            routerDelegate: todoRouterDelegate,
            routeInformationParser: todoInfoParser,
            backButtonDispatcher: RootBackButtonDispatcher(),
            builder: (_, child) => Consumer(
              builder: (_, ref, __) {
                categoryViewModel = ref.read(categoryViewModelPod.notifier);
                return child!;
              },
            ),
          ),
        ),
      );
    }

    Future<void> initScreensAndRedirect(WidgetTester tester) async {
      await pumpMainScreen(tester);
      await tester.pump(const Duration(seconds: 1));

      final button = find.byType(FloatingActionButton);

      await tester.ensureVisible(button);
      await tester.pumpAndSettle();

      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byType(FormCategoryView), findsOneWidget);
    }

    testWidgets(
      'Click on close button and verify if close it ',
      (tester) async {
        await initScreensAndRedirect(tester);

        expect(find.byType(CustomMouseRegion), findsOneWidget);

        final foundMouseRegion = find.descendant(
          of: find.byType(CustomMouseRegion),
          matching: find.byType(MouseRegion),
        );
        expect(foundMouseRegion, findsOneWidget);

        await tester.tap(foundMouseRegion);
        await tester.pumpAndSettle();
      },
      variant: TargetPlatformVariant.desktop(),
    );

    testWidgets(
      'Show $SubmitCategory disabled when text fields forms are empty',
      (tester) async {
        await initScreensAndRedirect(tester);

        final foundButton = find.byType(SubmitCategory);

        await tester.enterText(find.byType(NameCategory), 'Test Category');
        await tester.pumpAndSettle();

        final enabled = tester.widget<SubmitCategory>(foundButton).onSubmit;
        expect(enabled == null, isTrue);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show $SubmitCategory enabled when text field forms are not empty',
      (tester) async {
        await initScreensAndRedirect(tester);

        final foundSubmitButton = find.byType(SubmitCategory);

        await tester.enterText(find.byType(NameCategory), 'Test Category');
        await tester.enterText(find.byType(EmojiCategory), '😀');

        await tester.pumpAndSettle();

        expect(
          tester.widget<SubmitCategory>(foundSubmitButton).onSubmit != null,
          isTrue,
        );
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Add $Category data from $FormCategoryView form fields',
      (tester) async {
        when(() => mockCategoryService.saveCategory(any())).thenAnswer(
          (_) => Future<void>.delayed(const Duration(seconds: 1)),
        );

        await initScreensAndRedirect(tester);

        await tester.enterText(find.byType(NameCategory), 'Test Category');
        await tester.enterText(find.byType(EmojiCategory), '😀');

        await tester.pumpAndSettle();
        await tester.tap(find.byType(SubmitCategory));

        verify(() => mockCategoryService.saveCategory(any())).called(1);

        expect(categoryViewModel.state.isLoading, true);
        await tester.pump(const Duration(milliseconds: 500));

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        await tester.pumpAndSettle();

        expect(categoryViewModel.state.isSuccess, true);
        expect(find.byType(CircularProgressIndicator), findsNothing);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'When try to add a $Category data set an $Exception',
      (tester) async {
        when(() => mockCategoryService.saveCategory(any())).thenThrow(
          Exception('Error'),
        );

        await initScreensAndRedirect(tester);

        await tester.enterText(find.byType(NameCategory), 'Test Category');
        await tester.enterText(find.byType(EmojiCategory), '😀');

        await tester.pumpAndSettle();
        await tester.tap(find.byType(SubmitCategory));

        verify(() => mockCategoryService.saveCategory(any())).called(1);
        expect(categoryViewModel.state.isError, true);
      },
      variant: TargetPlatformVariant.all(),
    );
  });
}
