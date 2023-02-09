import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/ui/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class TodoItemTile extends StatelessWidget {
  const TodoItemTile({
    required this.title,
    required this.subTitle,
    required this.isNegative,
    required this.isSuccess,
    required this.onTap,
    super.key,
  });

  final String title;
  final String subTitle;
  final bool isNegative;
  final bool isSuccess;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
                ? const TextStyle(fontSize: 16, color: Colors.red)
                : const TextStyle(fontSize: 16),
      ).paddingSymmetric(v: 4),
      trailing: CustomCheckbox(
        value: isSuccess,
        enabled: !isSuccess,
        onChanged: (_) => onTap(),
      ),
    );
  }
}
