import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/ui/todo_category_list_view.dart';
import 'package:crud_todo_app/ui/widgets/category_item.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../repository/category_repository_test.dart';
import '../test_utils/params_factory.dart';

void main() {
  late MockCategoryService mockCategoryService;
  late ICategoryRepository categoryRepository;

  setUpAll(() {
    mockCategoryService = MockCategoryService();
    categoryRepository = CategoryRepository(mockCategoryService);
    registerFallbackValue(MyCategoryFake());
  });

  group('$TodoCategoryListView UI screen', () {
    testWidgets('Show $TodoCategoryListView screen', (tester) async {
      await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(home: TodoCategoryListView()),
      ));

      expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
      expect(find.text('Lists'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets(
        'Show empty data in '
        '$TodoCategoryListView screen', (tester) async {
      when(mockCategoryService.getCategories).thenAnswer(
        (_) => Stream.value([]),
      );

      await tester.pumpWidget(ProviderScope(
        overrides: [
          categoryRepositoryProvider.overrideWithValue(categoryRepository),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (_, ref, __) {
                final categories = ref.watch(categoryDataProvider);
                if (categories.data == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                return categories.data!.value.isEmpty
                    ? const Center(child: Text('Empty data'))
                    : const Offstage();
              },
            ),
          ),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Empty data'), findsOneWidget);
    });

    testWidgets('Show data $TodoCategoryListView in screen', (tester) async {
      when(categoryRepository.getCategories).thenAnswer(
        (_) => Stream.value([category]),
      );

      await tester.pumpWidget(ProviderScope(
        overrides: [
          categoryRepositoryProvider.overrideWithValue(categoryRepository),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (_, ref, __) {
                final categories = ref.watch(categoryDataProvider);

                if (categories.data == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                final list = categories.data!.value;
                return list.isNotEmpty
                    ? GridView.count(crossAxisCount: 2, children: <Widget>[
                        for (final item in list) CategoryItem(item: item),
                      ])
                    : const Offstage();
              },
            ),
          ),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(tester.widgetList(find.byType(CategoryItem)), [
        isA<CategoryItem>()
            .having((w) => w.item.id, 'id', categoryId)
            .having((w) => w.item.name, 'name', categoryName)
            .having((w) => w.item.emoji, 'emoji', categoryEmoji)
            .having((w) => w.item.todoSize, 'todoSize', 0),
      ]);
    });
  });
}
