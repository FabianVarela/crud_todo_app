import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<Todo>> getTodosByCategory(String catId);

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String todoId, String catId);
}

class TodoRepository implements ITodoRepository {
  TodoRepository();

  static const String _categoryCollection = 'categories';
  static const String _todoCollection = 'todos';

  late final _database = FirebaseFirestore.instance;

  @override
  Stream<List<Todo>> getTodosByCategory(String catId) {
    final querySnapshot = _database
        .collection(_todoCollection)
        .where('categoryId', isEqualTo: catId)
        .snapshots();

    return querySnapshot.map(
        (query) => query.docs.map((doc) => Todo.fromMap(doc.toMap())).toList());
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    if (todo.id.isNotEmpty) {
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

  @override
  Future<void> deleteTodo(String todoId, String catId) async {
    await _database.collection(_todoCollection).doc(todoId).delete();
    await _database
        .collection(_categoryCollection)
        .doc(catId)
        .update({'todoSize': FieldValue.increment(-1)});
  }
}
