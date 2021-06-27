import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.item, this.onClick})
      : super(key: key);

  final Category item;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              item.emoji.code,
              style: const TextStyle(fontSize: 30),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ).paddingOnly(b: 3),
                Text(
                  '${item.todoSize} Tasks',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
