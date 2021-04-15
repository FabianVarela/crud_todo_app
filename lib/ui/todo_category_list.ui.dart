import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/ui/dialog/category_dialog.ui.dart';
import 'package:crud_todo_app/ui/todo_list.ui.dart';
import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/viewModel/category.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoCategoryListUI extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final categoryStream = watch(categoryDataProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu_rounded,
          color: Colors.black,
          size: 30,
        ).paddingHorizontal(25),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Lists',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ).paddingHorizontal(12),
          const SizedBox(height: 20),
          Expanded(
            child: categoryStream.when(
              data: (categories) => Container(
                child: categories.isNotEmpty
                    ? GridView.count(
                        crossAxisCount: 2,
                        children: [
                          for (final item in categories)
                            CategoryItem(item: item),
                        ],
                      )
                    : Center(
                        child: Text(
                          'Empty data, add a category',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Container(
                child: Center(
                  child: Text(
                    e.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ).paddingHorizontal(16),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4A78FA),
        onPressed: () => _showCategoryDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: CategoryFormDialog(),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Category item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => TodoListUI(category: item),
        ),
      ),
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
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${item.todoSize} Tasks',
                  style: TextStyle(
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
