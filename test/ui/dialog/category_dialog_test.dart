import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/ui/dialog/category_dialog.dart';
import 'package:crud_todo_app/ui/todo_category_list_view.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_utils/mocks.dart';

void main() {
  late MockNavigator mockNavigator;

  late MockCategoryService mockCategoryService;
  late ICategoryRepository categoryRepository;

  setUpAll(() {
    mockCategoryService = MockCategoryService();
    categoryRepository = CategoryRepository(mockCategoryService);
    registerFallbackValue(MyCategoryFake());

    registerFallbackValue(MyRouteFake());
    mockNavigator = MockNavigator();
  });

  group('$CategoryFormDialog UI section', () {
    testWidgets(
        'Show $Dialog section in $TodoCategoryListView screen '
        'when set tap in $FloatingActionButton', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(home: TodoCategoryListView()),
      ));

      final finderFloatingButton = find.byType(FloatingActionButton);
      final BuildContext context = tester.element(finderFloatingButton);

      await tester.press(finderFloatingButton);

      // ignore: unawaited_futures
      showDialog<void>(
        context: context,
        builder: (_) => const Center(
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: CategoryFormDialog(),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(Dialog), findsOneWidget);

      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.text('Add category'), findsOneWidget);
      expect(find.byType(NameCategory), findsOneWidget);
      expect(find.byType(EmojiCategory), findsOneWidget);
      expect(find.byType(SubmitCategory), findsOneWidget);
    });

    testWidgets(
        'Check $Dialog close button and verify if close it '
        'when set tap in $GestureDetector', (tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: const Scaffold(body: CategoryFormDialog()),
          navigatorObservers: [mockNavigator],
        ),
      ));

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets(
        '$CategoryFormDialog show $SubmitCategory disabled when $NameCategory '
        'or $EmojiCategory TextField are empty', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: CategoryFormDialog()),
        ),
      ));

      final foundSubmitButton = find.byType(SubmitCategory);

      await tester.enterText(find.byType(NameCategory), 'Test Category');
      await tester.pumpAndSettle();

      final enabled = tester.widget<SubmitCategory>(foundSubmitButton).enabled;
      expect(enabled, isFalse);
    });

    testWidgets(
        '$CategoryFormDialog show $SubmitCategory enabled when $NameCategory '
        'or $EmojiCategory TextField are not empty', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: CategoryFormDialog()),
        ),
      ));

      final foundSubmitButton = find.byType(SubmitCategory);

      await tester.enterText(find.byType(NameCategory), 'Test Category');
      await tester.enterText(find.byType(EmojiCategory), '😀');

      await tester.pumpAndSettle();

      final enabled = tester.widget<SubmitCategory>(foundSubmitButton).enabled;
      expect(enabled, isTrue);
    });

    testWidgets('Add $Category model from $CategoryFormDialog', (tester) async {
      late final ICategoryViewModel viewModel;

      when(() => mockCategoryService.saveCategory(any()))
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
          child: const MaterialApp(
            home: Scaffold(body: CategoryFormDialog()),
          ),
        ),
      ));

      await tester.enterText(find.byType(NameCategory), 'Test Category');
      await tester.enterText(find.byType(EmojiCategory), '😀');

      await tester.pumpAndSettle();

      expect(viewModel.debugState, isA<CategoryStateInitial>());
      await tester.tap(find.byType(SubmitCategory));

      verify(() => mockCategoryService.saveCategory(any())).called(1);

      expect(viewModel.debugState, isA<CategoryStateLoading>());
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();

      expect(viewModel.debugState, isA<CategoryStateSuccess>());
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });
}
