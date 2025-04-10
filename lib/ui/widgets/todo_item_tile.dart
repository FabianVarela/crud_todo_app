import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/ui/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

final class TodoItemTile extends StatelessWidget {
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
        style: TextStyle(
          fontSize: 22,
          color: isSuccess ? const Color(0xFF6474A9) : null,
          decoration: isSuccess ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontSize: 16,
          color: isNegative ? Colors.red : null,
          decoration: isSuccess ? TextDecoration.lineThrough : null,
        ),
      ).paddingSymmetric(v: 4),
      trailing: CustomCheckbox(
        value: isSuccess,
        enabled: !isSuccess,
        onChanged: (_) => onTap(),
      ),
    );
  }
}
