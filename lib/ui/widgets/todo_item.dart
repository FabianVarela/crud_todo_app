import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/ui/widgets/todo_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum TodoItemState { unchecked, loading, checked }

class TodoItem extends HookWidget {
  const TodoItem({
    Key? key,
    required this.todo,
    this.onEdit,
    this.onRemove,
    this.onCheck,
  }) : super(key: key);

  final Todo todo;
  final Function()? onEdit;
  final Function()? onRemove;
  final Future<bool> Function(bool)? onCheck;

  @override
  Widget build(BuildContext context) {
    final tileState = useState(
      todo.isCompleted ? TodoItemState.checked : TodoItemState.unchecked,
    );

    useValueChanged<bool, void>(todo.isCompleted, (_, __) {
      tileState.value =
          todo.isCompleted ? TodoItemState.checked : TodoItemState.unchecked;
    });

    final canShowCheck = tileState.value != TodoItemState.unchecked;

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actions: onEdit != null &&
              (!canShowCheck && !todo.finalDate.isDurationNegative)
          ? <Widget>[
              IconSlideAction(
                caption: 'Edit',
                color: const Color(0xFF4D4E50),
                icon: Icons.edit,
                onTap: onEdit,
              ),
            ]
          : <Widget>[],
      secondaryActions: onRemove != null && !canShowCheck
          ? <Widget>[
              IconSlideAction(
                caption: 'Remove',
                color: Colors.red,
                icon: Icons.delete,
                onTap: onRemove,
              ),
            ]
          : <Widget>[],
      child: TodoItemTile(
        title: todo.subject,
        subTitle: todo.finalDate.isDurationNegative
            ? todo.finalDate.timeDateToFormattedString
            : todo.finalDate.isToday
                ? todo.finalDate.timeFormattedString
                : todo.finalDate.dateTimeToFormattedString,
        isNegative: todo.finalDate.isDurationNegative,
        state: tileState.value,
        onTap: () async {
          const value = true;

          if (onCheck != null && tileState.value == TodoItemState.unchecked) {
            tileState.value = TodoItemState.loading;
            final isSuccess = await onCheck!(value);

            if (isSuccess) {
              tileState.value = TodoItemState.checked;
            } else {
              tileState.value = TodoItemState.unchecked;
            }
          }
        },
      ),
    );
  }
}
