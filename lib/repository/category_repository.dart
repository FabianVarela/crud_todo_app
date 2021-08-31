import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/service/category_service.dart';

abstract class ICategoryRepository {
  Stream<List<Category>> getCategories();

  Future<Category> getCategoryById(String categoryId);

  Future<void> saveCategory(Category category);

  Future<void> deleteCategory(String catId);
}

class CategoryRepository implements ICategoryRepository {
  CategoryRepository(this._categoryService);

  final CategoryService _categoryService;

  @override
  Stream<List<Category>> getCategories() => _categoryService.getCategories();

  @override
  Future<Category> getCategoryById(String categoryId) =>
      _categoryService.getCategoryById(categoryId);

  @override
  Future<void> saveCategory(Category category) async =>
      _categoryService.saveCategory(category);

  @override
  Future<void> deleteCategory(String catId) async =>
      _categoryService.deleteCategory(catId);
}
