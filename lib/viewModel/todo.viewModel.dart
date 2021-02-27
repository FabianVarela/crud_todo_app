import 'package:crud_todo_app/database/todo.database.dart';
import 'package:crud_todo_app/dependency/injector.dart';
import 'package:crud_todo_app/model/todo.model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoDataProvider = StreamProvider.family<List<Todo>, String>(
  (ref, catId) => getIt<ITodoDatabase>().getTodosByCategory(catId),
);

final isAddedTodoProvider = StateProvider.autoDispose((_) => false);

final idTodoProvider = StateProvider.autoDispose((_) => '');
final subjectTodoProvider = StateProvider.autoDispose((_) => '');
final dateTodoProvider = StateProvider.autoDispose((_) => DateTime.now());

final validationTodoProvider = StateProvider.autoDispose((ref) {
  final subject = ref.watch(subjectTodoProvider).state;
  final date = ref.watch(dateTodoProvider).state;

  return subject.isNotEmpty && !date.difference(DateTime.now()).isNegative;
});

final todoViewModelProvider = Provider((_) => TodoViewModel());

class TodoViewModel {
  final _database = getIt<ITodoDatabase>();

  void saveTodo(String todoId, String todoSubject, bool todoCompleted,
      String categoryId) async {
    final todo = Todo(
      id: todoId,
      subject: todoSubject,
      isCompleted: todoCompleted,
      finalDate: DateTime.now(),
      categoryId: categoryId,
    );
    await _database.saveTodo(todo, categoryId);
  }

  void removeTodo(String todoId) async => await _database.deleteTodo(todoId);

  void checkTodo(Todo todo, String categoryId) async => await _database
      .saveTodo(todo.copyWith(isCompleted: !todo.isCompleted), categoryId);
}
