import 'package:crud_todo_app/common/validations.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/model/todo.model.dart';
import 'package:crud_todo_app/model/validation_text.model.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_provider.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoViewModel extends StateNotifier<TodoState> with Validations {
  late final Reader _read;

  TodoViewModel(this._read) : super(const TodoState.initial());

  ValidationText onChangeSubject(String value) => validateEmpty(value);

  void saveTodo(String catId) async {
    try {
      state = TodoState.loading();

      final id = _read(idTodoProvider).state;
      final subject = _read(subjectTodoProvider).state.text ?? '';
      final date = _read(dateTodoProvider).state;

      await _read(todoRepositoryProvider).saveTodo(
        Todo(id: id, subject: subject, finalDate: date, categoryId: catId),
      );

      if (id.isEmpty) {
        state = TodoState.success(TodoAction.add);
      } else {
        state = TodoState.success(TodoAction.update);
      }
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }

  void removeTodo(String todoId, String catId) async {
    try {
      await _read(todoRepositoryProvider).deleteTodo(todoId, catId);
      state = TodoState.success(TodoAction.remove);
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }

  void checkTodo(Todo todo, bool isChecked) async {
    try {
      await _read(todoRepositoryProvider).saveTodo(
        todo.copyWith(isCompleted: isChecked),
      );
      state = TodoState.success(TodoAction.check);
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }
}
