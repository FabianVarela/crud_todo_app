import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListPod = StreamProvider.autoDispose.family<List<Todo>, String>(
  (ref, catId) => ref.watch(todoRepositoryPod).getTodosByCategory(catId),
);

final todoDetailPod = FutureProvider.autoDispose.family<Todo?, String>(
  (ref, param) {
    final params = param.split(',');
    return params[0].isNotEmpty && params[1].isNotEmpty
        ? ref.watch(todoRepositoryPod).getTodoById(params[0], params[1])
        : Future.value();
  },
);

final subjectTodoPod = StateProvider.autoDispose(
  (_) => const ValidationText(),
);
final dateTodoPod = StateProvider.autoDispose((_) => DateTime.now());

final validationTodoProvider = StateProvider.autoDispose((ref) {
  final subject = ref.watch(subjectTodoPod).text;
  final date = ref.watch(dateTodoPod);

  return (subject ?? '').isNotEmpty && !date.isDurationNegative;
});
