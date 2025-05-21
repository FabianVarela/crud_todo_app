import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListProvider = StreamProvider.family.autoDispose((
  ref,
  String categoryId,
) {
  return ref
      .watch(todoRepositoryProvider)
      .getTodosByCategory(categoryId: categoryId);
});

final todoDetailProvider = FutureProvider.family.autoDispose((
  ref,
  ({String categoryId, String todoId}) param,
) async {
  final categoryId = param.categoryId;
  final todoId = param.todoId;

  return categoryId.trim().isNotEmpty && todoId.trim().isNotEmpty
      ? ref
            .watch(todoRepositoryProvider)
            .getTodoById(categoryId: categoryId, todoId: todoId)
      : null;
});

final subjectTodoProvider = StateProvider.autoDispose(
  (_) => const ValidationText(),
);
final dateTodoProvider = StateProvider.autoDispose((_) => DateTime.now());

final validationTodoProvider = StateProvider.autoDispose((ref) {
  final subject = ref.watch(subjectTodoProvider).text;
  final date = ref.watch(dateTodoProvider);

  return (subject ?? '').isNotEmpty && !date.isDurationNegative;
});
