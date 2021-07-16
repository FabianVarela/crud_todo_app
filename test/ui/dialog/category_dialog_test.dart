import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/ui/dialog/category_dialog.dart';
import 'package:crud_todo_app/ui/todo_category_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../repository/category_repository_test.dart';

void main() {
  late MockCategoryService mockCategoryService;
  late ICategoryRepository categoryRepository;

  setUpAll(() {
    mockCategoryService = MockCategoryService();
    categoryRepository = CategoryRepository(mockCategoryService);
    registerFallbackValue(MyCategoryFake());
  });

  group('Category dialog section to add category', () {
    testWidgets('Show dialog in category list UI', (WidgetTester tester) async {
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
    });

    testWidgets('Add category from dialog', (WidgetTester tester) async {
      when(() => mockCategoryService.saveCategory(any()))
          .thenAnswer((_) => Future.value());

      await tester.pumpWidget(ProviderScope(
        overrides: [
          categoryRepositoryProvider.overrideWithValue(categoryRepository)
        ],
        child: const MaterialApp(
          home: Scaffold(body: CategoryFormDialog()),
        ),
      ));

      final findNameTextCat = find.byType(NameCategory);
      final findEmojiTextCat = find.byType(EmojiCategory);
      final findSubmitButtonCat = find.byType(SubmitCategory);

      expect(find.text('Add category'), findsOneWidget);
      expect(findNameTextCat, findsOneWidget);
      expect(findEmojiTextCat, findsOneWidget);
      expect(findSubmitButtonCat, findsOneWidget);

      await tester.enterText(findNameTextCat, 'Test Category');
      await tester.enterText(findEmojiTextCat, '😀');

      expect(findNameTextCat.evaluate().isNotEmpty, true);
      expect(findEmojiTextCat.evaluate().isNotEmpty, true);

      await tester.pumpAndSettle();

      expect(
        tester.widget<SubmitCategory>(findSubmitButtonCat).enabled,
        isTrue,
      );

      // await tester.press(findSubmitButtonCat);
      // await tester.pumpAndSettle();
      // expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
