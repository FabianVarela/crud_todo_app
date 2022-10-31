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
      overrides: [categoryServicePod.overrideWithValue(mockCategoryService)],
    );
    categoryRepository = container.read(categoryRepositoryPod);
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
      when(() => mockCategoryService.getCategoryById(any()))
          .thenAnswer((_) => future);

      // act
      final result = categoryRepository.getCategoryById(category.id!);

      // assert
      expect(result, isA<Future<Category>>());
      expect(result, equals(future));

      verify(() => mockCategoryService.getCategoryById(any()));
      verifyNoMoreInteractions(mockCategoryService);
    });

    test('should save new category when saveCategory is called', () {
      // arrange
      when(() => mockCategoryService.saveCategory(any()))
          .thenAnswer((_) => Future.value());

      // act
      final result = categoryRepository.saveCategory(initialCategory);

      // assert
      expect(result, isA<Future<void>>());
      verify(() => mockCategoryService.saveCategory(any()));
      verifyNoMoreInteractions(mockCategoryService);
    });

    test('should delete when deleteCategory is called', () {
      // arrange
      when(() => mockCategoryService.deleteCategory(any()))
          .thenAnswer((_) => Future.value());

      // act
      final result = categoryRepository.deleteCategory('catId');

      // assert
      expect(result, isA<Future<void>>());
      verify(() => mockCategoryService.deleteCategory(any()));
      verifyNoMoreInteractions(mockCategoryService);
    });
  });
}
