import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoViewModel extends StateNotifier<TodoState> {
  TodoViewModel(this._repository) : super(const TodoState.initial());

  late final ITodoRepository _repository;

  Future<void> saveTodo({
    required String categoryId,
    required String subject,
    required DateTime date,
    String? todoId,
  }) async {
    try {
      state = const TodoState.loading();

      await _repository.saveTodo(
        todo: Todo(
          id: todoId,
          subject: subject,
          finalDate: date,
          categoryId: categoryId,
        ),
      );

      state = todoId == null
          ? const TodoState.success(TodoAction.add)
          : const TodoState.success(TodoAction.update);
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }

  Future<void> deleteTodo({
    required String todoId,
    required String categoryId,
  }) async {
    try {
      state = const TodoState.loading();
      await _repository.deleteTodo(todoId: todoId, categoryId: categoryId);
      state = const TodoState.success(TodoAction.remove);
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }

  Future<void> checkTodo({required Todo todo, bool isChecked = false}) async {
    try {
      state = const TodoState.loading();
      await _repository.saveTodo(
        todo: todo.copyWith(isCompleted: isChecked),
      );
      state = const TodoState.success(TodoAction.check);
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }
}
