import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/todo.model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/ui/add_todo.ui.dart';
import 'package:crud_todo_app/ui/widgets/custom_checkbox.dart';
import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/viewmodel/todo.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoListUI extends ConsumerWidget {
  const TodoListUI({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final todoStream = watch(todoDataProvider(category.id!));

    return Scaffold(
      backgroundColor: Color(0xFF4A78FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              context
                  .read(categoryViewModelProvider)
                  .deleteCategory(category.id!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: todoStream.when(
        data: (todos) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      category.emoji.code,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        category.name,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${todos.length} Tasks',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingHorizontal(35),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: todos.isNotEmpty
                    ? ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (_, pos) => TodoItem(
                          item: todos[pos],
                          category: category,
                        ),
                      ).paddingSymmetric(24, 20)
                    : Center(
                        child: Text(
                          'Empty data, add a task',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Container(
          child: Center(
            child: Text(e.toString(), style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4A78FA),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => AddTodoUI(category: category)),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoItem extends HookWidget {
  const TodoItem({
    Key? key,
    required this.item,
    required this.category,
  }) : super(key: key);

  final Todo item;
  final Category category;

  @override
  Widget build(BuildContext context) {
    final todoProvider = useProvider(todoViewModelProvider);

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: !item.isCompleted && !item.finalDate.isDurationNegative
          ? <Widget>[
              IconSlideAction(
                caption: 'Edit',
                color: Color(0xFF4D4E50),
                icon: Icons.edit,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AddTodoUI(category: category, todo: item),
                  ),
                ),
              ),
            ]
          : <Widget>[],
      secondaryActions: !item.isCompleted
          ? <Widget>[
              IconSlideAction(
                caption: 'Remove',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => todoProvider.removeTodo(item.id, item.categoryId),
              ),
            ]
          : <Widget>[],
      child: ListTile(
        title: Text(
          item.subject,
          style: item.isCompleted
              ? TextStyle(
                  fontSize: 22,
                  color: Color(0xFF6474A9),
                  decoration: TextDecoration.lineThrough,
                )
              : TextStyle(fontSize: 22),
        ),
        subtitle: Text(
          item.finalDate.isDurationNegative
              ? item.finalDate.timeDateToFormattedString
              : item.finalDate.isToday
                  ? item.finalDate.timeFormattedString
                  : item.finalDate.dateTimeToFormattedString,
          style: item.isCompleted
              ? TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough,
                )
              : item.finalDate.isDurationNegative
                  ? TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    )
                  : TextStyle(fontSize: 16),
        ).paddingVertical(4),
        trailing: CustomCheckbox(
          value: item.isCompleted,
          enabled: !item.isCompleted,
          onChanged: (bool value) => todoProvider.checkTodo(item, value),
        ),
      ),
    );
  }
}
