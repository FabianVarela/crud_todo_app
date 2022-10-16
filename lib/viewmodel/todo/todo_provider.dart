import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/*
TODO: Restore autoDispose when error has been fixed
  https://github.com/rrousselGit/riverpod/issues/1713
  https://github.com/dart-lang/sdk/issues/50119
*/

final todoListPod = StreamProvider.family<List<Todo>, String>(
  (ref, catId) => ref.watch(todoRepositoryPod).getTodosByCategory(catId),
);

final todoDetailPod = FutureProvider.family<Todo?, String>(
  (ref, param) {
    final params = param.split(',');
    return params[0].trim().isNotEmpty && params[1].trim().isNotEmpty
        ? ref.watch(todoRepositoryPod).getTodoById(params[0], params[1])
        : Future.value();
  },
);

final subjectTodoPod = StateProvider((_) => const ValidationText());
final dateTodoPod = StateProvider((_) => DateTime.now());

final validationTodoProvider = StateProvider((ref) {
  final subject = ref.watch(subjectTodoPod).text;
  final date = ref.watch(dateTodoPod);

  return (subject ?? '').isNotEmpty && !date.isDurationNegative;
});
