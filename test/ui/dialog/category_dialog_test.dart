import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/ui/dialog/category_dialog.dart';
import 'package:crud_todo_app/ui/widgets/custom_mouse_region.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_utils/mocks.dart';

void main() {
  group('$CategoryFormDialog UI section', () {
    late MockCategoryService mockCategoryService;
    late ICategoryRepository categoryRepository;

    late MockNavigator mockNavigator;

    setUpAll(() {
      mockCategoryService = MockCategoryService();
      categoryRepository = CategoryRepository(mockCategoryService);
      registerFallbackValue(MyCategoryFake());

      mockNavigator = MockNavigator();
      registerFallbackValue(MyRouteFake());
    });

    Future<void> pumpDialog(WidgetTester tester, Widget child) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            categoryRepositoryPod.overrideWithValue(categoryRepository),
          ],
          child: MaterialApp(
            home: child,
            navigatorObservers: [mockNavigator],
          ),
        ),
      );
    }

    testWidgets(
        'Check $Dialog close button and verify if close it '
        'when set tap in $GestureDetector', (tester) async {
      await pumpDialog(tester, const Scaffold(body: CategoryFormDialog()));

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets(
      'Check $Dialog close button and verify if close it '
      'when set tap in $GestureDetector in desktop',
      (tester) async {
        await pumpDialog(tester, const Scaffold(body: CategoryFormDialog()));

        expect(find.byType(CustomMouseRegion), findsOneWidget);

        final foundMouseRegion = find.descendant(
          of: find.byType(CustomMouseRegion),
          matching: find.byType(MouseRegion),
        );
        expect(foundMouseRegion, findsOneWidget);

        await tester.tap(foundMouseRegion);
        await tester.pumpAndSettle();

        verify(() => mockNavigator.didPop(any(), any())).called(1);
      },
      variant: TargetPlatformVariant.desktop(),
    );

    testWidgets(
        '$CategoryFormDialog show $SubmitCategory disabled when $NameCategory '
        'or $EmojiCategory TextField are empty', (tester) async {
      await pumpDialog(tester, const Scaffold(body: CategoryFormDialog()));

      final foundSubmitButton = find.byType(SubmitCategory);

      await tester.enterText(find.byType(NameCategory), 'Test Category');
      await tester.pumpAndSettle();

      final enabled = tester.widget<SubmitCategory>(foundSubmitButton).onSubmit;
      expect(enabled == null, isTrue);
    });

    testWidgets(
        '$CategoryFormDialog show $SubmitCategory enabled when $NameCategory '
        'or $EmojiCategory TextField are not empty', (tester) async {
      await pumpDialog(tester, const Scaffold(body: CategoryFormDialog()));

      final foundSubmitButton = find.byType(SubmitCategory);

      await tester.enterText(find.byType(NameCategory), 'Test Category');
      await tester.enterText(find.byType(EmojiCategory), '😀');

      await tester.pumpAndSettle();

      final enabled = tester.widget<SubmitCategory>(foundSubmitButton).onSubmit;
      expect(enabled != null, isTrue);
    });

    testWidgets('Add $Category model from $CategoryFormDialog', (tester) async {
      late final CategoryViewModel viewModel;

      when(() => mockCategoryService.saveCategory(any()))
          .thenAnswer((_) => Future<void>.delayed(const Duration(seconds: 1)));

      await pumpDialog(
        tester,
        Consumer(
          builder: (_, ref, child) {
            viewModel = ref.read(categoryViewModelPod.notifier);
            return const Scaffold(body: CategoryFormDialog());
          },
        ),
      );

      await tester.enterText(find.byType(NameCategory), 'Test Category');
      await tester.enterText(find.byType(EmojiCategory), '😀');

      await tester.pumpAndSettle();
      await tester.tap(find.byType(SubmitCategory));

      verify(() => mockCategoryService.saveCategory(any())).called(1);

      expect(viewModel.debugState.isLoading, true);
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();

      expect(viewModel.debugState.isSuccess, true);
      expect(find.byType(CircularProgressIndicator), findsNothing);

      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets('When Add $Category model set an $Exception', (tester) async {
      late final CategoryViewModel viewModel;

      when(() => mockCategoryService.saveCategory(any()))
          .thenThrow(Exception('Error'));

      await pumpDialog(
        tester,
        Consumer(
          builder: (_, ref, child) {
            viewModel = ref.read(categoryViewModelPod.notifier);
            return const Scaffold(body: CategoryFormDialog());
          },
        ),
      );

      await tester.enterText(find.byType(NameCategory), 'Test Category');
      await tester.enterText(find.byType(EmojiCategory), '😀');

      await tester.pumpAndSettle();
      await tester.tap(find.byType(SubmitCategory));

      verify(() => mockCategoryService.saveCategory(any())).called(1);
      expect(viewModel.debugState.isError, true);
    });
  });
}
