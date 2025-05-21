import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/ui/widgets/custom_date_picker.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_provider.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final class FormTodoView extends HookConsumerWidget {
  const FormTodoView({required this.categoryId, this.todoId, super.key});

  final String categoryId;
  final String? todoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryData = ref.watch(categoryDetailProvider(categoryId));
    final todoData = ref.watch(
      todoDetailProvider((categoryId: categoryId, todoId: todoId ?? '')),
    );

    ref.listen(todoViewModelProvider, (_, state) {
      if (state case TodoStateSuccess(:final action)) {
        if (action == TodoAction.add || action == TodoAction.update) {
          Navigator.pop(context);
        }
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          todoId == null ? 'New Task' : 'Update Task',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: categoryData.maybeWhen(
        data: (category) {
          return todoData.whenOrNull(
            data: (todo) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: <Widget>[
                    SubjectTodo(todo: todo).paddingSymmetric(h: 30, v: 30),
                    DateTodo(todo: todo).paddingSymmetric(h: 30, v: 20),
                    CategoryTodo(
                      category: category,
                    ).paddingSymmetric(h: 30, v: 20),
                    SubmitTodo(
                      categoryId: categoryId,
                      todoId: todo?.id,
                    ).paddingSymmetric(h: 16),
                  ],
                ),
              );
            },
            error: (e, _) {
              return Center(
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        orElse: Offstage.new,
      ),
    );
  }
}

final class SubjectTodo extends HookConsumerWidget {
  const SubjectTodo({required this.todo, super.key});

  final Todo? todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subject = ref.watch(subjectTodoProvider.notifier);
    final subjectTextController = useTextEditingController();

    useEffect(() {
      if (todo != null) {
        Future.microtask(() {
          ref.read(subjectTodoProvider.notifier).update((_) {
            return ValidationText(text: todo!.subject);
          });
          subjectTextController.text = todo!.subject;
        });
      }
      return null;
    }, const []);

    return TextField(
      controller: subjectTextController,
      maxLines: 5,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'What are you planning?',
        hintStyle: const TextStyle(color: Colors.grey),
        errorText: subject.state.message,
      ),
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onChanged: (value) => subject.update((_) => value.validateEmpty),
    );
  }
}

final class DateTodo extends HookConsumerWidget {
  const DateTodo({required this.todo, super.key});

  final Todo? todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finalDate = ref.watch(dateTodoProvider);

    useEffect(() {
      if (todo != null) {
        Future.microtask(
          () => ref.read(dateTodoProvider.notifier).state = todo!.finalDate,
        );
      }
      return null;
    }, const []);

    return InkWell(
      onTap: () {
        CustomDatePicker.show(
          context,
          initialDate: finalDate.isDurationNegative
              ? DateTime.now().add(const Duration(minutes: 2))
              : finalDate.add(const Duration(minutes: 2)),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onChangeDate: (d) => ref.read(dateTodoProvider.notifier).state = d,
        );
      },
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.notifications_active_outlined,
            color: Color(0xFF4A78FA),
          ).paddingOnly(r: 12),
          Text(
            finalDate.dateTimeToFormattedString,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

final class CategoryTodo extends StatelessWidget {
  const CategoryTodo({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.local_offer_outlined,
          color: Color(0xFF77C783),
        ).paddingOnly(r: 12),
        Expanded(
          child: Row(
            children: <Widget>[
              Text(
                category.emoji.code,
                style: const TextStyle(fontSize: 16),
              ).paddingOnly(b: 5, r: 5),
              Text(
                category.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final class SubmitTodo extends HookConsumerWidget {
  const SubmitTodo({required this.categoryId, this.todoId, super.key});

  final String categoryId;
  final String? todoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidForm = ref.watch(validationTodoProvider);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A78FA)),
      onPressed: isValidForm ? () => _saveTodo(ref) : null,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          todoId == null ? 'Create' : 'Update',
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ).paddingSymmetric(v: 16),
    );
  }

  void _saveTodo(WidgetRef ref) {
    final subject = ref.read(subjectTodoProvider.notifier).state.text!;
    final date = ref.read(dateTodoProvider.notifier).state;

    ref
        .read(todoViewModelProvider.notifier)
        .saveTodo(
          categoryId: categoryId,
          subject: subject,
          date: date,
          todoId: todoId,
        );
  }
}
