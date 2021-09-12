import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/ui/dialog/category_dialog.dart';
import 'package:crud_todo_app/ui/category_list_view.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:crud_todo_app/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  group('$CategoryListView UI screen', () {
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

    Future<void> _pumpMainScreen(WidgetTester tester, Widget child) async {
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

    testWidgets('Show $CategoryListView screen', (tester) async {
      await _pumpMainScreen(tester, const CategoryListView());

      expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
      expect(find.text('Lists'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets(
        'Show $Dialog section in $CategoryListView screen '
        'when set tap in $FloatingActionButton', (tester) async {
      await _pumpMainScreen(tester, const CategoryListView());

      final finderFloatingButton = find.byType(FloatingActionButton);

      await tester.tap(finderFloatingButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(CategoryFormDialog), findsOneWidget);

      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.text('Add category'), findsOneWidget);
      expect(find.byType(NameCategory), findsOneWidget);
      expect(find.byType(EmojiCategory), findsOneWidget);
      expect(find.byType(SubmitCategory), findsOneWidget);
    });

    testWidgets(
        'Show empty data in '
        '$CategoryListView screen', (tester) async {
      when(mockCategoryService.getCategories)
          .thenAnswer((_) => Stream.value([]));

      await _pumpMainScreen(tester, const CategoryListView());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Empty data, add a category'), findsOneWidget);
    });

    testWidgets('Show data $CategoryListView in screen', (tester) async {
      when(categoryRepository.getCategories)
          .thenAnswer((_) => Stream.value([category]));

      await _pumpMainScreen(tester, const CategoryListView());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(GridView), findsOneWidget);

      expect(tester.widgetList(find.byType(CategoryItem)), [
        isA<CategoryItem>()
            .having((w) => w.item.id, 'id', categoryId)
            .having((w) => w.item.name, 'name', categoryName)
            .having((w) => w.item.emoji, 'emoji', categoryEmoji)
            .having((w) => w.item.todoSize, 'todoSize', 0),
      ]);
    });

    testWidgets(
        'Make redirection when tap '
        'selected $Category to $TodoListView screen', (tester) async {
      when(categoryRepository.getCategories)
          .thenAnswer((_) => Stream.value([category]));

      await _pumpMainScreen(tester, const CategoryListView());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(GridView), findsOneWidget);

      final foundCatItem = find.descendant(
        of: find.byType(GridView),
        matching: find.byType(CategoryItem),
      );
      expect(foundCatItem, findsOneWidget);

      await tester.tap(foundCatItem);
      await tester.pumpAndSettle();

      verify(() => mockNavigator.didPush(any(), any()));
      expect(find.byType(TodoListView), findsOneWidget);
    });

    testWidgets(
        'Show $Exception in screen when '
        'get $Category list data', (tester) async {
      when(categoryRepository.getCategories)
          .thenThrow(Exception('Category not found'));

      await _pumpMainScreen(tester, const CategoryListView());

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Exception: Category not found'), findsOneWidget);
    });
  });
}
