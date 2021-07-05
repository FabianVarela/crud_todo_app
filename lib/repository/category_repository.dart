import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider_dependency.dart';

abstract class ICategoryRepository {
  Stream<List<Category>> getCategories();

  Future<void> saveCategory(Category category);

  Future<void> deleteCategory(String catId);
}

class CategoryRepository implements ICategoryRepository {
  CategoryRepository(this.read);

  final Reader read;

  FirebaseFirestore get _database => read(databaseProvider);

  static const String _categoryCollection = 'categories';
  static const String _todoCollection = 'todos';

  @override
  Stream<List<Category>> getCategories() {
    final querySnapshot = _database.collection(_categoryCollection).snapshots();

    return querySnapshot.map((query) =>
        query.docs.map((doc) => Category.fromMap(doc.toMap())).toList());
  }

  @override
  Future<void> saveCategory(Category category) async => category.id != null
      ? await _database
          .collection(_categoryCollection)
          .doc(category.id)
          .update(category.toJson())
      : await _database.collection(_categoryCollection).add(category.toJson());

  @override
  Future<void> deleteCategory(String catId) async {
    await _database.collection(_categoryCollection).doc(catId).delete();

    final snapshot = await _database
        .collection(_todoCollection)
        .where('categoryId', isEqualTo: catId)
        .get();

    for (var i = 0; i < snapshot.docs.length; i++) {
      await snapshot.docs[i].reference.delete();
    }
  }
}
