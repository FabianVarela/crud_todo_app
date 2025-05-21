import 'package:context_menus/context_menus.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/ui/widgets/todo_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

final class TodoItem extends StatelessWidget {
  const TodoItem({
    required this.todo,
    this.onEdit,
    this.onRemove,
    this.onCheck,
    super.key,
  }) : isSlidable = true;

  const TodoItem.contextual({
    required this.todo,
    this.onEdit,
    this.onRemove,
    this.onCheck,
    super.key,
  }) : isSlidable = false;

  final Todo todo;
  final VoidCallback? onEdit;
  final VoidCallback? onRemove;
  final ValueSetter<bool>? onCheck;
  final bool isSlidable;

  @override
  Widget build(BuildContext context) {
    final itemTile = TodoItemTile(
      title: todo.subject,
      subTitle: todo.finalDate.isDurationNegative
          ? todo.finalDate.timeDateToFormattedString
          : todo.finalDate.isToday
          ? todo.finalDate.timeFormattedString
          : todo.finalDate.dateTimeToFormattedString,
      isNegative: todo.finalDate.isDurationNegative,
      isSuccess: todo.isCompleted,
      onTap: () => onCheck?.call(true),
    );

    return isSlidable
        ? Slidable(
            enabled: !todo.isCompleted,
            startActionPane:
                onEdit != null && !todo.finalDate.isDurationNegative
                ? ActionPane(
                    motion: const DrawerMotion(),
                    children: <Widget>[
                      SlidableAction(
                        label: 'Edit',
                        backgroundColor: const Color(0xFF4D4E50),
                        icon: Icons.edit,
                        onPressed: (_) => onEdit?.call(),
                      ),
                    ],
                  )
                : null,
            endActionPane: onRemove != null
                ? ActionPane(
                    motion: const DrawerMotion(),
                    children: <Widget>[
                      SlidableAction(
                        label: 'Remove',
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        onPressed: (_) => onRemove?.call(),
                      ),
                    ],
                  )
                : null,
            child: itemTile,
          )
        : ContextMenuRegion(
            isEnabled: !todo.isCompleted,
            contextMenu: GenericContextMenu(
              buttonConfigs: <ContextMenuButtonConfig>[
                ContextMenuButtonConfig(
                  'Edit',
                  icon: const Icon(Icons.edit, color: Color(0xFF4D4E50)),
                  onPressed:
                      onEdit != null && !todo.finalDate.isDurationNegative
                      ? () {
                          onEdit?.call();
                          context.contextMenuOverlay.hide();
                        }
                      : null,
                ),
                ContextMenuButtonConfig(
                  'Remove',
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    onRemove?.call();
                    context.contextMenuOverlay.hide();
                  },
                ),
              ],
            ),
            child: itemTile,
          );
  }
}
