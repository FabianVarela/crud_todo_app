import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/todo_model.dart';

class TodoService {
  TodoService(this._database);

  late final FirebaseFirestore _database;

  static const String _categoryCollection = 'categories';
  static const String _todoCollection = 'todos';

  Stream<List<Todo>> getTodosByCategory(String categoryId) {
    final querySnapshot = _database
        .collection(_todoCollection)
        .where('categoryId', isEqualTo: categoryId)
        .snapshots();

    return querySnapshot.map(
      (query) => [for (var item in query.docs) Todo.fromJson(item.toMap())],
    );
  }

  Future<Todo> getTodoById(String categoryId, String todoId) async {
    final todoCollection = _database.collection(_todoCollection);
    final todoDocument = await todoCollection.doc(todoId).get();

    if (todoDocument.exists) {
      final todoMap = todoDocument.toMap();
      if (todoMap.containsValue(categoryId)) return Todo.fromJson(todoMap);
    }

    throw Exception('Oops!!! Todo not found');
  }

  Future<void> saveTodo(Todo todo) async {
    if (todo.id != null) {
      await _database
          .collection(_todoCollection)
          .doc(todo.id)
          .update(todo.toJson());
    } else {
      await _database.collection(_todoCollection).add(todo.toJson());
      await _database
          .collection(_categoryCollection)
          .doc(todo.categoryId)
          .update({'todoSize': FieldValue.increment(1)});
    }
  }

  Future<void> deleteTodo(String todoId, String categoryId) async {
    await _database.collection(_todoCollection).doc(todoId).delete();
    await _database
        .collection(_categoryCollection)
        .doc(categoryId)
        .update({'todoSize': FieldValue.increment(-1)});
  }
}
