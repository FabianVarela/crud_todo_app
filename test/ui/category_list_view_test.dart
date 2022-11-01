import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/navigator/crud_todo_information_parser.dart';
import 'package:crud_todo_app/navigator/crud_todo_router_delegate.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/ui/category_list_view.dart';
import 'package:crud_todo_app/ui/dialog/category_dialog.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:crud_todo_app/ui/widgets/category_item.dart';
import 'package:crud_todo_app/ui/widgets/custom_mouse_region.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  group('$CategoryListView UI screen', () {
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

    testWidgets(
      'Show $CategoryListView screen',
      (tester) async {
        await pumpMainScreen(tester);

        expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
        expect(find.text('Lists'), findsOneWidget);
        expect(find.byType(FloatingActionButton), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show $Dialog in when set tap in $FloatingActionButton',
      (tester) async {
        await pumpMainScreen(tester);

        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.byType(Dialog), findsOneWidget);
        expect(find.byType(CategoryFormDialog), findsOneWidget);

        expect(find.byIcon(Icons.close), findsOneWidget);
        expect(find.text('Add category'), findsOneWidget);
        expect(find.byType(NameCategory), findsOneWidget);
        expect(find.byType(EmojiCategory), findsOneWidget);
        expect(find.byType(SubmitCategory), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show empty data in $CategoryListView screen',
      (tester) async {
        when(mockCategoryService.getCategories).thenAnswer(
          (_) => Stream.value([]),
        );

        await pumpMainScreen(tester);

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.text('Empty data, add a category'), findsOneWidget);
      },
      variant: TargetPlatformVariant.mobile(),
    );

    testWidgets(
      'Show data in $CategoryListView screen',
      (tester) async {
        when(categoryRepository.getCategories).thenAnswer(
          (_) => Stream.value([category]),
        );

        await pumpMainScreen(tester);

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
      },
      variant: TargetPlatformVariant.mobile(),
    );

    testWidgets(
      'Redirect when select a $Category to $TodoListView screen',
      (tester) async {
        when(categoryRepository.getCategories).thenAnswer(
          (_) => Stream.value([category]),
        );

        await pumpMainScreen(tester);

        final platforms = [TargetPlatform.iOS, TargetPlatform.fuchsia];
        if (!platforms.contains(foundation.defaultTargetPlatform)) {
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        }
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

        expect(find.byType(TodoListView), findsOneWidget);
      },
      variant: TargetPlatformVariant.mobile(),
    );

    testWidgets(
      'Show $Exception in $CategoryListView screen',
      (tester) async {
        when(categoryRepository.getCategories).thenThrow(
          Exception('Category not found'),
        );

        await pumpMainScreen(tester);

        expect(find.byType(CircularProgressIndicator), findsNothing);
        await tester.pumpAndSettle();
        expect(find.text('Exception: Category not found'), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(),
    );

    testWidgets(
      'Show tooltip in $CategoryItem using the $CustomMouseRegion widget',
      (tester) async {
        when(categoryRepository.getCategories).thenAnswer(
          (_) => Stream.value([category]),
        );

        await pumpMainScreen(tester);

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byType(GridView), findsOneWidget);

        final foundMouseRegion = find.descendant(
          of: find.descendant(
            of: find.byType(GridView),
            matching: find.byType(CustomMouseRegion),
          ),
          matching: find.byType(MouseRegion),
        );
        expect(foundMouseRegion, findsOneWidget);

        final foundTooltip = find.descendant(
          of: foundMouseRegion,
          matching: find.byType(Tooltip),
        );
        expect(foundTooltip, findsOneWidget);

        final gesture = await tester.createGesture(
          kind: PointerDeviceKind.mouse,
        );
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);

        await gesture.moveTo(tester.getCenter(foundMouseRegion));
        await tester.pumpAndSettle();

        expect(foundTooltip.hitTestable(), findsOneWidget);
      },
      variant: TargetPlatformVariant.desktop(),
    );
  });
}
