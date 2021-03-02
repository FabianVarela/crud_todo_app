import 'package:crud_todo_app/database/todo.database.dart';
import 'package:crud_todo_app/dependency/injector.dart';
import 'package:crud_todo_app/model/todo.model.dart';
import 'package:crud_todo_app/model/validation_text.model.dart';
import 'package:crud_todo_app/utils/utils.dart';
import 'package:crud_todo_app/utils/validations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoDataProvider = StreamProvider.family<List<Todo>, String>(
  (ref, catId) => getIt<ITodoDatabase>().getTodosByCategory(catId),
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

final todoViewModelProvider = Provider((_) => TodoViewModel());

class TodoViewModel with Validations {
  final _database = getIt<ITodoDatabase>();

  ValidationText onChangeSubject(String value) => validateEmpty(value);

  void saveTodo(String id, String subject, bool isOk, DateTime finalDate,
          String catId) async =>
      await _database.saveTodo(Todo(
        id: id,
        subject: subject,
        isCompleted: isOk,
        finalDate: finalDate,
        categoryId: catId,
      ));

  void removeTodo(String todoId, String catId) async =>
      await _database.deleteTodo(todoId, catId);

  void checkTodo(Todo todo, bool isChecked) async =>
      await _database.saveTodo(todo.copyWith(isCompleted: isChecked));
}
