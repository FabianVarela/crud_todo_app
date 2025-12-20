import 'dart:async';

import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/ui/widgets/custom_date_picker.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_provider.dart';
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

    ref.listen(todoViewModelProvider, (_, state) {
      state.whenOrNull(
        data: (data) {
          if (data == .add || data == .update) Navigator.pop(context);
        },
      );
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
            fontWeight: .w400,
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
        data: (category) => Consumer(
          builder: (_, ref, _) {
            final param = (categoryId: category.id!, todoId: todoId ?? '');
            final todoData = ref.watch(todoDetailProvider(param));

            return todoData.maybeWhen(
              data: (todo) => SingleChildScrollView(
                padding: const .symmetric(vertical: 20),
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
              ),
              error: (e, _) => Center(
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              orElse: Offstage.new,
            );
          },
        ),
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
    final subject = ref.watch(subjectTodoProvider);
    final subjectTextController = useTextEditingController();

    useEffect(() {
      if (todo != null) {
        unawaited(
          Future.microtask(() {
            ref.read(subjectTodoProvider.notifier).init(todo!.subject);
            subjectTextController.text = todo!.subject;
          }),
        );
      }
      return null;
    }, const []);

    return TextField(
      controller: subjectTextController,
      maxLines: 5,
      textInputAction: .done,
      decoration: InputDecoration(
        hintText: 'What are you planning?',
        hintStyle: const TextStyle(color: Colors.grey),
        errorText: subject.message,
      ),
      style: const TextStyle(fontSize: 25, fontWeight: .w300),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onChanged: (value) {
        ref.read(subjectTodoProvider.notifier).onChangeSubject(value);
      },
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
        unawaited(
          Future.microtask(
            () => ref.read(dateTodoProvider.notifier).init(todo!.finalDate),
          ),
        );
      }
      return null;
    }, const []);

    return InkWell(
      onTap: () => unawaited(_showPicker(context, ref, finalDate)),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.notifications_active_outlined,
            color: Color(0xFF4A78FA),
          ).paddingOnly(r: 12),
          Text(
            finalDate.dateTimeToFormattedString,
            style: const TextStyle(fontSize: 16, fontWeight: .w600),
          ),
        ],
      ),
    );
  }

  Future<void> _showPicker(
    BuildContext context,
    WidgetRef ref,
    DateTime finalDate,
  ) async {
    await CustomDatePicker.show(
      context,
      initialDate: finalDate.isDurationNegative
          ? DateTime.now().add(const Duration(minutes: 2))
          : finalDate.add(const Duration(minutes: 2)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      onChangeDate: (value) {
        ref.read(dateTodoProvider.notifier).onChangeDate(value);
      },
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
                style: const TextStyle(fontSize: 16, fontWeight: .w400),
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
        width: .infinity,
        alignment: .center,
        child: Text(
          todoId == null ? 'Create' : 'Update',
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ).paddingSymmetric(v: 16),
    );
  }

  Future<void> _saveTodo(WidgetRef ref) async {
    await ref
        .read(todoViewModelProvider.notifier)
        .saveTodo(
          categoryId: categoryId,
          subject: ref.read(subjectTodoProvider).text!,
          date: ref.read(dateTodoProvider),
          todoId: todoId,
        );
  }
}
