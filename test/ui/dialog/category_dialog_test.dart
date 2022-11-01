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
  group('$CategoryFormDialog UI dialog', () {
    late final MockFirestore mockFirestoreInstance;

    late final MockCategoryService mockCategoryService;
    late final ICategoryRepository categoryRepository;

    setUpAll(() {
      mockFirestoreInstance = MockFirestore();

      mockCategoryService = MockCategoryService();
      categoryRepository = CategoryRepository(mockCategoryService);
      registerFallbackValue(MyCategoryFake());
    });

    Future<void> pumpDialog(WidgetTester tester, Widget child) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            firebasePod.overrideWithValue(mockFirestoreInstance),
            categoryServicePod.overrideWithValue(mockCategoryService),
            categoryRepositoryPod.overrideWithValue(categoryRepository),
          ],
          child: MaterialApp(home: child),
        ),
      );
    }

    testWidgets(
      'Click on close button and verify if close it ',
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
      },
      variant: TargetPlatformVariant.desktop(),
    );

    testWidgets(
      'Show $SubmitCategory disabled when text fields forms are empty',
      (tester) async {
        await pumpDialog(tester, const Scaffold(body: CategoryFormDialog()));

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
        await pumpDialog(tester, const Scaffold(body: CategoryFormDialog()));

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
      'Add $Category data from $CategoryFormDialog form fields',
      (tester) async {
        late final CategoryViewModel viewModel;

        when(() => mockCategoryService.saveCategory(any())).thenAnswer(
          (_) => Future<void>.delayed(const Duration(seconds: 1)),
        );

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
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'When try to add a $Category data set an $Exception',
      (tester) async {
        late final CategoryViewModel viewModel;

        when(() => mockCategoryService.saveCategory(any())).thenThrow(
          Exception('Error'),
        );

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
      },
      variant: TargetPlatformVariant.all(),
    );
  });
}
