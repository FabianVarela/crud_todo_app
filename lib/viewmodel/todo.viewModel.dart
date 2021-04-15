import 'package:crud_todo_app/common/validations.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/todo.repository.dart';
import 'package:crud_todo_app/model/todo.model.dart';
import 'package:crud_todo_app/model/validation_text.model.dart';
import 'package:crud_todo_app/common/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoDataProvider = StreamProvider.family<List<Todo>, String>(
  (ref, catId) => ref.read(todoRepositoryProvider).getTodosByCategory(catId),
);

final isAddedTodoProvider = StateProvider.autoDispose((_) => false);

final idTodoProvider = StateProvider.autoDispose((_) => '');
final subjectTodoProvider = StateProvider.autoDispose((_) => ValidationText());
final dateTodoProvider = StateProvider.autoDispose((_) => DateTime.now());

final validationTodoProvider = StateProvider.autoDispose((ref) {
  final subject = ref.watch(subjectTodoProvider).state.text;
  final date = ref.watch(dateTodoProvider).state;

  return (subject ?? '').isNotEmpty && !date.isDurationNegative;
});

class TodoViewModel with Validations {
  late final ITodoRepository _repository;

  TodoViewModel(this._repository);

  ValidationText onChangeSubject(String value) => validateEmpty(value);

  void saveTodo(String id, String subject, DateTime date, String catId) async =>
      await _repository.saveTodo(
          Todo(id: id, subject: subject, finalDate: date, categoryId: catId));

  void removeTodo(String todoId, String catId) async =>
      await _repository.deleteTodo(todoId, catId);

  void checkTodo(Todo todo, bool isChecked) async =>
      await _repository.saveTodo(todo.copyWith(isCompleted: isChecked));
}
