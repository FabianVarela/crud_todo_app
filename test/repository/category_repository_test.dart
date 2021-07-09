import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/repository/category_service.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCategoryService extends Mock implements CategoryService {}
class MyCategoryFake extends Fake implements Category {}

void main() {
  late MockCategoryService mockCategoryService;
  late ICategoryRepository categoryRepository;

  setUpAll(() {
    mockCategoryService = MockCategoryService();
    categoryRepository = CategoryRepository(mockCategoryService);
    registerFallbackValue(MyCategoryFake());
  });

  group('$CategoryRepository', () {
    final category = Category(name: 'name', emoji: Emoji.None);

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

    test('should save new category when saveCategory is called', () {
      // arrange
      when(() => mockCategoryService.saveCategory(any()))
          .thenAnswer((_) => Future.value());

      // act
      final result = categoryRepository.saveCategory(category);

      // assert
      expect(result, isA<Future<void>>());
      verify(() => mockCategoryService.saveCategory(any()));
      verifyNoMoreInteractions(mockCategoryService);
    });
  });
}
