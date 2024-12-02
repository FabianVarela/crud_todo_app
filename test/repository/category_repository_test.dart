import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  late MockCategoryService mockCategoryService;
  late ICategoryRepository categoryRepository;

  setUpAll(() {
    mockCategoryService = MockCategoryService();
    registerFallbackValue(MyCategoryFake());

    // Using simple Riverpod to test dependencies
    final container = ProviderContainer(
      overrides: [
        categoryServiceProvider.overrideWithValue(mockCategoryService),
      ],
    );
    categoryRepository = container.read(categoryRepositoryProvider);
  });

  group('$CategoryRepository', () {
    test(
        'should get a stream with a $List of $Category '
        'when getCategories is called', () async {
      // arrange
      final stream = Stream.value([category]);
      when(() => mockCategoryService.getCategories()).thenAnswer((_) => stream);

      // act
      final result = categoryRepository.getCategories();

      // assert
      expect(result, isA<Stream<List<Category>>>());
      expect(result, equals(stream));

      verify(() => mockCategoryService.getCategories());
      verifyNoMoreInteractions(mockCategoryService);
    });

    test(
        'should get a future with a $Category '
        'when getCategoryById is called', () async {
      // arrange
      final future = Future.value(category);
      when(
        () => mockCategoryService.getCategoryById(
          categoryId: any(named: 'categoryId'),
        ),
      ).thenAnswer((_) => future);

      // act
      final result = categoryRepository.getCategoryById(
        categoryId: category.id!,
      );

      // assert
      expect(result, isA<Future<Category>>());
      expect(result, equals(future));

      verify(
        () => mockCategoryService.getCategoryById(
          categoryId: any(named: 'categoryId'),
        ),
      );
      verifyNoMoreInteractions(mockCategoryService);
    });

    test('should save new category when saveCategory is called', () {
      // arrange
      when(
        () => mockCategoryService.saveCategory(
          category: any(named: 'category'),
        ),
      ).thenAnswer((_) => Future.value());

      // act
      final result = categoryRepository.saveCategory(category: initialCategory);

      // assert
      expect(result, isA<Future<void>>());
      verify(
        () => mockCategoryService.saveCategory(
          category: any(named: 'category'),
        ),
      );
      verifyNoMoreInteractions(mockCategoryService);
    });

    test('should delete when deleteCategory is called', () {
      // arrange
      when(
        () => mockCategoryService.deleteCategory(
          categoryId: any(named: 'categoryId'),
        ),
      ).thenAnswer((_) => Future.value());

      // act
      final result = categoryRepository.deleteCategory(categoryId: 'catId');

      // assert
      expect(result, isA<Future<void>>());
      verify(
        () => mockCategoryService.deleteCategory(
          categoryId: any(named: 'categoryId'),
        ),
      );
      verifyNoMoreInteractions(mockCategoryService);
    });
  });
}
