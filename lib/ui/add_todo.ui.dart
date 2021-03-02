import 'dart:io';

import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/todo.model.dart';
import 'package:crud_todo_app/model/validation_text.model.dart';
import 'package:crud_todo_app/utils/utils.dart';
import 'package:crud_todo_app/viewModel/todo.viewModel.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTodoUI extends HookWidget {
  AddTodoUI({Key key, this.category, this.todo});

  final Category category;
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final todoProvider = useProvider(todoViewModelProvider);

    final id = useProvider(idTodoProvider);
    final subject = useProvider(subjectTodoProvider);
    final finalDate = useProvider(dateTodoProvider);

    final validation = useProvider(validationTodoProvider);
    final isAdded = useProvider(isAddedTodoProvider);

    final subjectController = useTextEditingController();

    useEffect(() {
      if (todo != null) {
        Future.microtask(() {
          id.state = todo.id;
          subject.state = ValidationText(text: todo.subject);
          finalDate.state = todo.finalDate;

          subjectController.text = subject.state.text;
        });
      }
      return;
    }, const []);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      appBar: _setAppBar(context),
      body: ProviderListener<StateController<bool>>(
        provider: isAddedTodoProvider,
        onChange: (_, addedState) {
          if (addedState.state) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => Navigator.pop(context),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _setSubjectText(todoProvider, subjectController, subject)
                  .paddingHorizontal(30),
              const SizedBox(height: 30),
              _setDateButton(context, finalDate).paddingHorizontal(30),
              const SizedBox(height: 20),
              _setCategoryText().paddingHorizontal(30),
              const SizedBox(height: 40),
              _setButton(todoProvider, validation.state, id.state,
                  subject.state.text, finalDate.state, isAdded),
            ],
          ),
        ),
      ).paddingVertical(20),
    );
  }

  Widget _setAppBar(BuildContext context) {
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

  Widget _setSubjectText(TodoViewModel vm, TextEditingController controller,
      StateController<ValidationText> subject) {
    return TextField(
      controller: controller,
      maxLines: 5,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'What are you planning?',
        hintStyle: TextStyle(color: Colors.grey),
        errorText: subject.state.message,
      ),
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w300,
      ),
      onChanged: (val) => subject.state = vm.onChangeSubject(val),
    );
  }

  Widget _setDateButton(BuildContext ctx, StateController<DateTime> finalDate) {
    return InkWell(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.notifications_active_outlined,
            color: Color(0xFF4A78FA),
          ),
          const SizedBox(width: 12),
          Text(
            finalDate.state.dateTimeToFormattedString,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      onTap: () => Platform.isIOS
          ? _selectedDateTimeIOS(ctx, finalDate)
          : _selectedDateTimeAndroid(ctx, finalDate),
    );
  }

  Widget _setCategoryText() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.local_offer_outlined,
          color: Color(0xFF77C783),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            children: <Widget>[
              Text(
                category.emoji.code,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 5),
              Text(
                category.name,
                style: TextStyle(
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

  Widget _setButton(TodoViewModel vm, bool isValid, String id, String subject,
      DateTime finalDate, StateController<bool> isAdded) {
    final isCompleted = todo?.isCompleted ?? false;

    return RaisedButton(
      color: Color(0xFF4A78FA),
      onPressed: isValid
          ? () {
              vm.saveTodo(id, subject, isCompleted, finalDate, category.id);
              isAdded.state = true;
            }
          : null,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Create',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ).paddingVertical(16),
    );
  }

  void _selectedDateTimeAndroid(
      BuildContext ctx, StateController<DateTime> finalDate) async {
    final pickedDate = await showDatePicker(
      context: ctx,
      initialDate: finalDate.state.isDurationNegative
          ? DateTime.now().add(Duration(minutes: 2))
          : finalDate.state.add(Duration(minutes: 2)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: ctx,
        initialTime: TimeOfDay.fromDateTime(finalDate.state),
      );

      if (pickedTime != null) {
        finalDate.state = DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day, pickedTime.hour, pickedTime.minute);
      }
    }
  }

  void _selectedDateTimeIOS(
      BuildContext ctx, StateController<DateTime> finalDate) {
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
                initialDateTime: finalDate.state.isDurationNegative
                    ? DateTime.now().add(Duration(minutes: 2))
                    : finalDate.state.add(Duration(minutes: 2)),
                minimumDate: DateTime.now(),
                maximumDate: DateTime.now().add(Duration(days: 365)),
                onDateTimeChanged: (DateTime pickedDate) =>
                    finalDate.state = pickedDate,
              ),
            ),
          ),
        ).paddingAll(10);
      },
    );
  }
}
