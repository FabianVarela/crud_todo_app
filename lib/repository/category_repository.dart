import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/service/category_service.dart';

abstract interface class ICategoryRepository {
  Stream<List<Category>> getCategories();

  Future<Category> getCategoryById({required String categoryId});

  Future<void> saveCategory({required Category category});

  Future<void> deleteCategory({required String categoryId});
}

class CategoryRepository implements ICategoryRepository {
  CategoryRepository(this._categoryService);

  final CategoryService _categoryService;

  @override
  Stream<List<Category>> getCategories() => _categoryService.getCategories();

  @override
  Future<Category> getCategoryById({required String categoryId}) =>
      _categoryService.getCategoryById(categoryId: categoryId);

  @override
  Future<void> saveCategory({required Category category}) async =>
      _categoryService.saveCategory(category: category);

  @override
  Future<void> deleteCategory({required String categoryId}) async =>
      _categoryService.deleteCategory(categoryId: categoryId);
}
