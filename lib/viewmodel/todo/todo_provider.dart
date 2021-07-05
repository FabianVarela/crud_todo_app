import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoDataProvider = StreamProvider.autoDispose.family<List<Todo>, String>(
  (ref, catId) => ref.read(todoRepositoryProvider).getTodosByCategory(catId),
);

final idTodoProvider = StateProvider.autoDispose((_) => '');
final subjectTodoProvider = StateProvider.autoDispose(
  (_) => const ValidationText(),
);
final dateTodoProvider = StateProvider.autoDispose((_) => DateTime.now());

final validationTodoProvider = StateProvider.autoDispose((ref) {
  final subject = ref.watch(subjectTodoProvider).state.text;
  final date = ref.watch(dateTodoProvider).state;

  return (subject ?? '').isNotEmpty && !date.isDurationNegative;
});
