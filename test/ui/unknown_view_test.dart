import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/navigator/crud_todo_information_parser.dart';
import 'package:crud_todo_app/navigator/crud_todo_router_delegate.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/ui/unknown_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';

void main() {
  late final MockFirestore mockFirestoreInstance;

  late final MockCategoryService mockCategoryService;
  late final ICategoryRepository categoryRepository;

  late final CrudTodoRouterDelegate todoRouterDelegate;
  late final CrudTodoInformationParser todoInfoParser;

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
          firebasePod.overrideWithValue(mockFirestoreInstance),
          categoryServicePod.overrideWithValue(mockCategoryService),
          categoryRepositoryPod.overrideWithValue(categoryRepository),
        ],
        child: MaterialApp.router(
          routerDelegate: todoRouterDelegate,
          routeInformationParser: todoInfoParser,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }

  group('$UnknownView UI screen', () {
    testWidgets('Show $UnknownView screen', (tester) async {
      await pumpMainScreen(tester);

      todoRouterDelegate.is404 = true;
      await tester.pumpAndSettle();

      expect(find.byType(UnknownView), findsOneWidget);

      expect(find.text('Not found'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.textContaining('Screen not found'), findsOneWidget);
    });
  });
}
