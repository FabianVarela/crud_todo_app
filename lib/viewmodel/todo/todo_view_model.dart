import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoViewModel extends StateNotifier<TodoState> {
  TodoViewModel(this._repository) : super(const TodoState.initial());

  late final ITodoRepository _repository;

  ValidationText onChangeSubject(String value) => value.validateEmpty();

  Future<void> saveTodo(
    String catId,
    String subject,
    DateTime date, {
    String? todoId,
  }) async {
    try {
      state = const TodoState.loading();

      await _repository.saveTodo(
        Todo(id: todoId, subject: subject, finalDate: date, categoryId: catId),
      );

      if (todoId == null) {
        state = const TodoState.success(TodoAction.add);
      } else {
        state = const TodoState.success(TodoAction.update);
      }
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }

  Future<void> deleteTodo(String todoId, String catId) async {
    try {
      state = const TodoState.loading();
      await _repository.deleteTodo(todoId, catId);
      state = const TodoState.success(TodoAction.remove);
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }

  Future<void> checkTodo(Todo todo, {bool isChecked = false}) async {
    try {
      state = const TodoState.loading();
      await _repository.saveTodo(
        todo.copyWith(isCompleted: isChecked),
      );
      state = const TodoState.success(TodoAction.check);
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }
}
