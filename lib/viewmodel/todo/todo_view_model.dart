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

  String get idTodo;

  ValidationText get subjectTodo;

  DateTime get dateTodo;

  ITodoRepository get todoRepository;

  ValidationText onChangeSubject(String value) => Utils.validateEmpty(value);

  void saveTodo(String catId) async {
    try {
      state = const TodoState.loading();

      final id = idTodo;
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

  void removeTodo(String todoId, String catId) async {
    try {
      await todoRepository.deleteTodo(todoId, catId);
      state = const TodoState.success(TodoAction.remove);
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }

  void checkTodo(Todo todo, bool isChecked) async {
    try {
      await todoRepository.saveTodo(
        todo.copyWith(isCompleted: isChecked),
      );
      state = const TodoState.success(TodoAction.check);
    } catch (e) {
      state = TodoState.error(e.toString());
    }
  }
}

class TodoViewModel extends ITodoViewModel {
  TodoViewModel(this._read);

  late final Reader _read;

  @override
  String get idTodo => _read(idTodoProvider).state;

  @override
  ValidationText get subjectTodo => _read(subjectTodoProvider).state;

  @override
  DateTime get dateTodo => _read(dateTodoProvider).state;

  @override
  ITodoRepository get todoRepository => _read(todoRepositoryProvider);
}
