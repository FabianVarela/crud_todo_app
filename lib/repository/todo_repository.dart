import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/service/todo_service.dart';

abstract class ITodoRepository {
  Stream<List<Todo>> getTodosByCategory(String categoryId);

  Future<Todo> getTodoById(String categoryId, String todoId);

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String todoId, String catId);
}

class TodoRepository implements ITodoRepository {
  TodoRepository(this._todoService);

  final TodoService _todoService;

  @override
  Stream<List<Todo>> getTodosByCategory(String categoryId) =>
      _todoService.getTodosByCategory(categoryId);

  @override
  Future<Todo> getTodoById(String categoryId, String todoId) =>
      _todoService.getTodoById(categoryId, todoId);

  @override
  Future<void> saveTodo(Todo todo) async => _todoService.saveTodo(todo);

  @override
  Future<void> deleteTodo(String todoId, String categoryId) async =>
      _todoService.deleteTodo(todoId, categoryId);
}
