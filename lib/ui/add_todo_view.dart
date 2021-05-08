import 'dart:io';

import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_provider.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:crud_todo_app/common/common.dart';

class AddTodoView extends HookConsumerWidget {
  const AddTodoView({Key? key, required this.category, this.todo});

  final Category category;
  final Todo? todo;

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    useEffect(() {
      if (todo != null) {
        Future.microtask(() => ref.read(idTodoProvider).state = todo!.id);
      }
    }, const []);

    return ProviderListener(
      provider: todoViewModelProvider,
      onChange: _onChangeState,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SubjectTextField(todo: todo).paddingSymmetric(h: 30, v: 30),
              DateButton(todo: todo).paddingSymmetric(h: 30, v: 20),
              CategoryText(category: category).paddingSymmetric(h: 30, v: 20),
              SubmitButton(categoryId: category.id!),
            ],
          ),
        ).paddingSymmetric(v: 20),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Text(
        'New Task',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }

  void _onChangeState(BuildContext context, TodoState state) {
    final action = state.maybeWhen(success: (a) => a, orElse: () => null);
    if (action != null) {
      if (action == TodoAction.add || action == TodoAction.update) {
        Navigator.pop(context);
      }
    }
  }
}

class SubjectTextField extends HookConsumerWidget {
  const SubjectTextField({Key? key, required this.todo}) : super(key: key);

  final Todo? todo;

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    final subject = ref.watch(subjectTodoProvider);
    final subjectTextController = useTextEditingController();

    useEffect(() {
      if (todo != null) {
        Future.microtask(() {
          ref.read(subjectTodoProvider).state =
              ValidationText(text: todo!.subject);
          subjectTextController.text = todo!.subject;
        });
      }
    }, const []);

    return TextField(
      controller: subjectTextController,
      maxLines: 5,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'What are you planning?',
        hintStyle: TextStyle(color: Colors.grey),
        errorText: subject.state.message,
      ),
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
      onChanged: (val) => subject.state =
          ref.read(todoViewModelProvider.notifier).onChangeSubject(val),
    );
  }
}

class DateButton extends HookConsumerWidget {
  const DateButton({Key? key, required this.todo}) : super(key: key);

  final Todo? todo;

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    final finalDate = ref.watch(dateTodoProvider);

    useEffect(() {
      if (todo != null) {
        Future.microtask(
          () => ref.read(dateTodoProvider).state = todo!.finalDate,
        );
      }
    }, const []);

    return InkWell(
      onTap: () => Platform.isIOS
          ? _dateIOS(context, finalDate)
          : _dateAndroid(context, finalDate),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.notifications_active_outlined,
            color: Color(0xFF4A78FA),
          ).paddingOnly(r: 12),
          Text(
            finalDate.state.dateTimeToFormattedString,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  void _dateAndroid(BuildContext ctx, StateController<DateTime> date) async {
    final pickedDate = await showDatePicker(
      context: ctx,
      initialDate: date.state.isDurationNegative
          ? DateTime.now().add(Duration(minutes: 2))
          : date.state.add(Duration(minutes: 2)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: ctx,
        initialTime: TimeOfDay.fromDateTime(date.state),
      );

      if (pickedTime != null) {
        date.state = DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
            pickedTime.hour, pickedTime.minute);
      }
    }
  }

  void _dateIOS(BuildContext ctx, StateController<DateTime> date) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Container(
          height: MediaQuery.of(ctx).size.height / 3,
          width: MediaQuery.of(ctx).size.width,
          color: Colors.white,
          child: cupertino.Container(
            height: MediaQuery.of(ctx).size.height / 4.5,
            child: cupertino.DefaultTextStyle(
              style: TextStyle(fontSize: 22),
              child: cupertino.CupertinoDatePicker(
                mode: cupertino.CupertinoDatePickerMode.dateAndTime,
                initialDateTime: date.state.isDurationNegative
                    ? DateTime.now().add(Duration(minutes: 2))
                    : date.state.add(Duration(minutes: 2)),
                minimumDate: DateTime.now(),
                maximumDate: DateTime.now().add(Duration(days: 365)),
                onDateTimeChanged: (DateTime pickedDate) =>
                    date.state = pickedDate,
              ),
            ),
          ),
        ).paddingAll(10);
      },
    );
  }
}

class CategoryText extends StatelessWidget {
  const CategoryText({cupertino.Key? key, required this.category})
      : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.local_offer_outlined, color: Color(0xFF77C783))
            .paddingOnly(r: 12),
        Expanded(
          child: Row(
            children: <Widget>[
              Text(category.emoji.code, style: TextStyle(fontSize: 16))
                  .paddingOnly(b: 5, r: 5),
              Text(
                category.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SubmitButton extends HookConsumerWidget {
  SubmitButton({Key? key, required this.categoryId}) : super(key: key);

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    final todoViewModel = ref.watch(todoViewModelProvider.notifier);

    final isValid = ref.watch(validationTodoProvider).state;
    final todoId = ref.watch(idTodoProvider).state;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Color(0xFF4A78FA)),
      onPressed: isValid ? () => todoViewModel.saveTodo(categoryId) : null,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          todoId.isEmpty ? 'Create' : 'Update',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ).paddingSymmetric(v: 16),
    );
  }
}
