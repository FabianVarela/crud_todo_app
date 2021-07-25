import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_provider.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ITodoViewModel extends StateNotifier<TodoState> {
  ITodoViewModel() : super(const TodoState.initial());

  ValidationText get subjectTodo;

  DateTime get dateTodo;

  ITodoRepository get todoRepository;

  ValidationText onChangeSubject(String value) => Utils.validateEmpty(value);

  void saveTodo(String catId, String? todoId) async {
    try {
      state = const TodoState.loading();

      final id = todoId ?? '';
      final subject = subjectTodo.text ?? '';
      final date = dateTodo;

      await todoRepository.saveTodo(
        Todo(id: id, subject: subject, finalDate: date, categoryId: catId),
      );

      if (id.isEmpty) {
        state = const TodoState.success(TodoAction.add);
      } else {
        state = const TodoState.success(TodoAction.update);
      }
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }

  void deleteTodo(String todoId, String catId) async {
    try {
      state = const TodoState.loading();
      await todoRepository.deleteTodo(todoId, catId);
      state = const TodoState.success(TodoAction.remove);
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }

  Future<bool> checkTodo(Todo todo, bool isChecked) async {
    try {
      state = const TodoState.loading();
      await todoRepository.saveTodo(
        todo.copyWith(isCompleted: isChecked),
      );
      state = const TodoState.success(TodoAction.check);
      return true;
    } catch (e) {
      state = TodoState.error(e.toString());
      return false;
    }
  }
}

class TodoViewModel extends ITodoViewModel {
  TodoViewModel(this._read);

  late final Reader _read;

  @override
  ValidationText get subjectTodo => _read(subjectTodoProvider).state;

  @override
  DateTime get dateTodo => _read(dateTodoProvider).state;

  @override
  ITodoRepository get todoRepository => _read(todoRepositoryProvider);
}
