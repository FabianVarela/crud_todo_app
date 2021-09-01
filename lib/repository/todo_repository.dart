import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/service/todo_service.dart';

abstract class ITodoRepository {
  Stream<List<Todo>> getTodosByCategory(String catId);

  Future<Todo> getTodoById(String todoId);

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String todoId, String catId);
}

class TodoRepository implements ITodoRepository {
  TodoRepository(this._todoService);

  final TodoService _todoService;

  @override
  Stream<List<Todo>> getTodosByCategory(String catId) =>
      _todoService.getTodosByCategory(catId);

  @override
  Future<Todo> getTodoById(String todoId) => _todoService.getTodoById(todoId);

  @override
  Future<void> saveTodo(Todo todo) async => _todoService.saveTodo(todo);

  @override
  Future<void> deleteTodo(String todoId, String catId) async =>
      _todoService.deleteTodo(todoId, catId);
}
