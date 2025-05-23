import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/navigator/crud_todo_information_parser.dart';
import 'package:crud_todo_app/navigator/crud_todo_router_delegate.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/ui/category_list_view.dart';
import 'package:crud_todo_app/ui/form_category_view.dart';
import 'package:crud_todo_app/ui/widgets/category_item.dart';
import 'package:crud_todo_app/ui/widgets/custom_mouse_region.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  final excludingPlatforms = {
    foundation.TargetPlatform.windows,
    foundation.TargetPlatform.linux,
    foundation.TargetPlatform.fuchsia,
  };

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
            firebaseProvider.overrideWithValue(mockFirestoreInstance),
            categoryServiceProvider.overrideWithValue(mockCategoryService),
            categoryRepositoryProvider.overrideWithValue(categoryRepository),
          ],
          child: MaterialApp.router(
            routerDelegate: todoRouterDelegate,
            routeInformationParser: todoInfoParser,
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        ),
      );
    }

    testWidgets('Show $CategoryListView screen', (tester) async {
      await pumpMainScreen(tester);

      expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
      expect(find.text('Lists'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    }, variant: TargetPlatformVariant.all());

    testWidgets(
      'Show $FormCategoryView in when set tap in $FloatingActionButton',
      (tester) async {
        await pumpMainScreen(tester);

        final button = find.byType(FloatingActionButton);

        await tester.ensureVisible(button);
        await tester.pumpAndSettle();

        await tester.tap(button);
        await tester.pumpAndSettle();

        expect(find.byType(FormCategoryView), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(excluding: excludingPlatforms),
    );

    testWidgets(
      'Show empty data in $CategoryListView screen',
      (tester) async {
        when(
          mockCategoryService.getCategories,
        ).thenAnswer((_) => Stream.value([]));

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
        when(
          categoryRepository.getCategories,
        ).thenAnswer((_) => Stream.value([category]));

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
      'Show $Exception in $CategoryListView screen',
      (tester) async {
        when(
          categoryRepository.getCategories,
        ).thenThrow(Exception('Category not found'));

        await pumpMainScreen(tester);

        expect(find.byType(CircularProgressIndicator), findsNothing);
        await tester.pumpAndSettle();
        expect(find.text('Exception: Category not found'), findsOneWidget);
      },
      variant: TargetPlatformVariant.all(excluding: excludingPlatforms),
    );

    testWidgets(
      'Show tooltip in $CategoryItem using the $CustomMouseRegion widget',
      (tester) async {
        when(
          categoryRepository.getCategories,
        ).thenAnswer((_) => Stream.value([category]));

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
      variant: TargetPlatformVariant.only(TargetPlatform.macOS),
    );

    testWidgets(
      'In $CategoryListView, refresh with the command keys',
      (tester) async {
        when(
          categoryRepository.getCategories,
        ).thenAnswer((_) => Stream.value([category]));

        await pumpMainScreen(tester);

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byType(GridView), findsOneWidget);

        await simulateKeyDownEvent(LogicalKeyboardKey.meta);
        await simulateKeyDownEvent(LogicalKeyboardKey.keyR);

        expect(find.byType(GridView), findsOneWidget);
      },
      variant: TargetPlatformVariant.only(TargetPlatform.macOS),
    );

    testWidgets(
      'In $CategoryListView, open dialog with the command keys',
      (tester) async {
        when(
          categoryRepository.getCategories,
        ).thenAnswer((_) => Stream.value([category]));

        await pumpMainScreen(tester);

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byType(GridView), findsOneWidget);

        await simulateKeyDownEvent(LogicalKeyboardKey.meta);
        await simulateKeyDownEvent(LogicalKeyboardKey.keyN);

        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(find.byType(Dialog), findsOneWidget);
      },
      variant: TargetPlatformVariant.only(TargetPlatform.macOS),
    );
  });
}
