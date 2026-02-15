// Use like a method
// ignore_for_file: use_setters_to_change_properties

import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListProvider = StreamProvider.family.autoDispose<List<Todo>, String>(
  (ref, categoryId) {
    return ref
        .watch(todoRepositoryProvider)
        .getTodosByCategory(categoryId: categoryId);
  },
);

final todoDetailProvider = FutureProvider.family.autoDispose(
  (ref, ({String categoryId, String todoId}) param) async {
    final categoryId = param.categoryId;
    final todoId = param.todoId;

    return categoryId.trim().isNotEmpty && todoId.trim().isNotEmpty
        ? ref
              .watch(todoRepositoryProvider)
              .getTodoById(categoryId: categoryId, todoId: todoId)
        : null;
  },
);

class SubjectTodo extends Notifier<ValidationText> {
  @override
  ValidationText build() => const ValidationText();

  void init(String value) => state = ValidationText(text: value);

  void onChangeSubject(String value) => state = value.validateEmpty;
}

final subjectTodoProvider = NotifierProvider.autoDispose(SubjectTodo.new);

class DateTodo extends Notifier<DateTime> {
  @override
  DateTime build() => DateTime.now();

  void init(DateTime value) => state = value;

  void onChangeDate(DateTime value) => state = value;
}

final dateTodoProvider = NotifierProvider.autoDispose(DateTodo.new);

class ValidationTodo extends Notifier<bool> {
  @override
  bool build() {
    final subject = ref.watch(subjectTodoProvider).text;
    final date = ref.watch(dateTodoProvider);

    return (subject ?? '').isNotEmpty && !date.isDurationNegative;
  }
}

final validationTodoProvider = NotifierProvider.autoDispose(ValidationTodo.new);
