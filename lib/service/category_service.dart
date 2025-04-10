import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/category_model.dart';

class CategoryService {
  CategoryService(this._database);

  late final FirebaseFirestore _database;

  static const String _categoryCollection = 'categories';
  static const String _todoCollection = 'todos';

  Stream<List<Category>> getCategories() {
    final querySnapshot = _database.collection(_categoryCollection).snapshots();
    return querySnapshot.map(
      (query) => [for (final item in query.docs) Category.fromJson(item.toMap)],
    );
  }

  Future<Category> getCategoryById({required String categoryId}) async {
    final categoryCollection = _database.collection(_categoryCollection);
    final categoryDocument = await categoryCollection.doc(categoryId).get();

    if (categoryDocument.exists) {
      return Category.fromJson(categoryDocument.toMap);
    }

    throw Exception('Oops!!! Category not found');
  }

  Future<void> saveCategory({required Category category}) async {
    category.id != null
        ? await _database
            .collection(_categoryCollection)
            .doc(category.id)
            .update(category.toJson())
        : await _database
            .collection(_categoryCollection)
            .add(category.toJson());
  }

  Future<void> deleteCategory({required String categoryId}) async {
    await _database.collection(_categoryCollection).doc(categoryId).delete();

    final snapshot =
        await _database
            .collection(_todoCollection)
            .where('categoryId', isEqualTo: categoryId)
            .get();

    for (var i = 0; i < snapshot.docs.length; i++) {
      await snapshot.docs[i].reference.delete();
    }
  }
}
