import 'dart:io';

import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/todo.model.dart';
import 'package:crud_todo_app/model/validation_text.model.dart';
import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/viewModel/todo.viewModel.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTodoUI extends HookWidget {
  AddTodoUI({Key? key, required this.category, this.todo});

  final Category category;
  final Todo? todo;

  @override
  Widget build(BuildContext context) {
    final id = useProvider(idTodoProvider);
    final subject = useProvider(subjectTodoProvider);
    final finalDate = useProvider(dateTodoProvider);

    final subjectText = useTextEditingController();

    useEffect(() {
      if (todo != null) {
        Future.microtask(() {
          id.state = todo!.id;
          subject.state = ValidationText(text: todo!.subject);
          finalDate.state = todo!.finalDate;

          subjectText.text = subject.state.text ?? '';
        });
      }
      return null;
    }, const []);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _appBar(context),
      body: ProviderListener<StateController<bool>>(
        provider: isAddedTodoProvider,
        onChange: (_, addedState) {
          if (addedState.state) {
            WidgetsBinding.instance!.addPostFrameCallback(
              (_) => Navigator.pop(context),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _subjectTextField(context, subjectText).paddingHorizontal(30),
              const SizedBox(height: 30),
              _dateButton(context).paddingHorizontal(30),
              const SizedBox(height: 20),
              _categoryText().paddingHorizontal(30),
              const SizedBox(height: 40),
              _setButton(id.state, subject.state.text ?? '', finalDate.state),
            ],
          ),
        ),
      ).paddingVertical(20),
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

  Widget _subjectTextField(BuildContext ctx, TextEditingController controller) {
    return Consumer(
      builder: (_, watch, __) => TextField(
        controller: controller,
        maxLines: 5,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'What are you planning?',
          hintStyle: TextStyle(color: Colors.grey),
          errorText: watch(subjectTodoProvider).state.message,
        ),
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
        onChanged: (val) => watch(subjectTodoProvider).state =
            ctx.read(todoViewModelProvider).onChangeSubject(val),
      ),
    );
  }

  Widget _dateButton(BuildContext ctx) {
    return Consumer(builder: (_, watch, __) {
      final finalDate = watch(dateTodoProvider);
      return InkWell(
        onTap: () => Platform.isIOS
            ? _dateIOS(ctx, finalDate)
            : _dateAndroid(ctx, finalDate),
        child: Row(
          children: <Widget>[
            Icon(Icons.notifications_active_outlined, color: Color(0xFF4A78FA)),
            const SizedBox(width: 12),
            Text(
              finalDate.state.dateTimeToFormattedString,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    });
  }

  Widget _categoryText() {
    return Row(
      children: <Widget>[
        Icon(Icons.local_offer_outlined, color: Color(0xFF77C783)),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            children: <Widget>[
              Text(category.emoji.code, style: TextStyle(fontSize: 16)),
              const SizedBox(width: 5),
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

  Widget _setButton(String id, String subject, DateTime finalDate) {
    return Consumer(builder: (_, watch, __) {
      final todoViewModel = watch(todoViewModelProvider);

      final isValid = watch(validationTodoProvider).state;
      final isAdded = watch(isAddedTodoProvider);

      return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color(0xFF4A78FA)),
        onPressed: isValid
            ? () {
                todoViewModel.saveTodo(id, subject, finalDate, category.id!);
                isAdded.state = true;
              }
            : null,
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            'Create',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ).paddingVertical(16),
      );
    });
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
