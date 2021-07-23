import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/ui/widgets/custom_checkbox.dart';
import 'package:crud_todo_app/ui/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class TodoItemTile extends StatelessWidget {
  const TodoItemTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.isNegative,
    required this.state,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final bool isNegative;
  final TodoItemState state;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final canShowCheck = state != TodoItemState.unchecked;
    final isSuccess = state == TodoItemState.checked;

    return ListTile(
      title: Text(
        title,
        style: isSuccess
            ? const TextStyle(
                fontSize: 22,
                color: Color(0xFF6474A9),
                decoration: TextDecoration.lineThrough,
              )
            : const TextStyle(fontSize: 22),
      ),
      subtitle: Text(
        subTitle,
        style: isSuccess
            ? const TextStyle(
                fontSize: 16,
                decoration: TextDecoration.lineThrough,
              )
            : isNegative
                ? const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  )
                : const TextStyle(fontSize: 16),
      ).paddingSymmetric(v: 4),
      trailing: CustomCheckbox(
        value: canShowCheck,
        enabled: !canShowCheck,
        onChanged: (_) => onTap(),
      ),
    );
  }
}
