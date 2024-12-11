import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/service/todo_service.dart';

abstract interface class ITodoRepository {
  Stream<List<Todo>> getTodosByCategory({required String categoryId});

  Future<Todo> getTodoById({
    required String categoryId,
    required String todoId,
  });

  Future<void> saveTodo({required Todo todo});

  Future<void> deleteTodo({required String todoId, required String categoryId});
}

final class TodoRepository implements ITodoRepository {
  TodoRepository(this._todoService);

  final TodoService _todoService;

  @override
  Stream<List<Todo>> getTodosByCategory({required String categoryId}) =>
      _todoService.getTodosByCategory(categoryId: categoryId);

  @override
  Future<Todo> getTodoById({
    required String categoryId,
    required String todoId,
  }) =>
      _todoService.getTodoById(categoryId: categoryId, todoId: todoId);

  @override
  Future<void> saveTodo({required Todo todo}) async =>
      _todoService.saveTodo(todo: todo);

  @override
  Future<void> deleteTodo({
    required String todoId,
    required String categoryId,
  }) async =>
      _todoService.deleteTodo(todoId: todoId, categoryId: categoryId);
}
