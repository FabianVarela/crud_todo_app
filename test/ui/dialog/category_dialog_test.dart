import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/ui/dialog/category_dialog.dart';
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

    Future<void> _pumpDialog(WidgetTester tester, Widget child) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          categoryRepositoryProvider.overrideWithValue(categoryRepository),
        ],
        child: MaterialApp(
          home: child,
          navigatorObservers: [mockNavigator],
        ),
      ));
    }

    testWidgets(
        'Check $Dialog close button and verify if close it '
        'when set tap in $GestureDetector', (tester) async {
      await _pumpDialog(tester, const Scaffold(body: CategoryFormDialog()));

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets(
        '$CategoryFormDialog show $SubmitCategory disabled when $NameCategory '
        'or $EmojiCategory TextField are empty', (tester) async {
      await _pumpDialog(tester, const Scaffold(body: CategoryFormDialog()));

      final foundSubmitButton = find.byType(SubmitCategory);

      await tester.enterText(find.byType(NameCategory), 'Test Category');
      await tester.pumpAndSettle();

      final enabled = tester.widget<SubmitCategory>(foundSubmitButton).enabled;
      expect(enabled, isFalse);
    });

    testWidgets(
        '$CategoryFormDialog show $SubmitCategory enabled when $NameCategory '
        'or $EmojiCategory TextField are not empty', (tester) async {
      await _pumpDialog(tester, const Scaffold(body: CategoryFormDialog()));

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

      await _pumpDialog(tester, Consumer(builder: (_, ref, child) {
        viewModel = ref.read(categoryViewModelProvider.notifier);
        return const Scaffold(body: CategoryFormDialog());
      }));

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

      verify(() => mockNavigator.didPop(any(), any())).called(1);
    });

    testWidgets('When Add $Category model set an $Exception', (tester) async {
      late final ICategoryViewModel viewModel;

      when(() => mockCategoryService.saveCategory(any()))
          .thenThrow(Exception('Error'));

      await _pumpDialog(tester, Consumer(builder: (_, ref, child) {
        viewModel = ref.read(categoryViewModelProvider.notifier);
        return const Scaffold(body: CategoryFormDialog());
      }));

      await tester.enterText(find.byType(NameCategory), 'Test Category');
      await tester.enterText(find.byType(EmojiCategory), '😀');

      await tester.pumpAndSettle();

      expect(viewModel.debugState, isA<CategoryStateInitial>());
      await tester.tap(find.byType(SubmitCategory));

      verify(() => mockCategoryService.saveCategory(any())).called(1);
      expect(viewModel.debugState, isA<CategoryStateError>());
    });
  });
}
