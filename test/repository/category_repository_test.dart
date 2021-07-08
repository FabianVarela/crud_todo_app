import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/repository/category_service.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCategoryService extends Mock implements CategoryService {}

void main() {
  late MockCategoryService mockCategoryService;
  late ICategoryRepository categoryRepository;

  setUp(() {
    mockCategoryService = MockCategoryService();
    categoryRepository = CategoryRepository(mockCategoryService);
  });

  group('$CategoryRepository', () {
    test(
        'should get a stream with a $List of $Category '
        'when getCategories is called', () async {
      // arrange
      final category = Category(name: 'name', emoji: Emoji.None);
      final stream = Stream.value([category]);
      when(() => mockCategoryService.getCategories()).thenAnswer((_) => stream);

      // act
      final result = categoryRepository.getCategories();

      // assert
      expect(result, isA<Stream<List<Category>>>());
      expect(result, equals(stream));
    });
  });
}
