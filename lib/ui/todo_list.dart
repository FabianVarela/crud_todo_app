import 'dart:async';

import 'package:crud_todo_app/model/todo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  TodoList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  List<Todo> _todoList = new List();

  Query _query;
  StreamSubscription<Event> _onAddedTodo;
  StreamSubscription<Event> _onChangedTodo;

  @override
  void initState() {
    super.initState();

    _query = _database.reference().child("todo").orderByChild("updateData");
    _onAddedTodo = _query.onChildAdded.listen(_onDataAdded);
    _onChangedTodo = _query.onChildChanged.listen(_onDataChanged);
  }

  void _onDataAdded(Event event) {
    setState(() {
      _todoList.add(Todo.fromSnapshot(event.snapshot));
    });
  }

  void _onDataChanged(Event event) {
    var oldData = _todoList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _todoList[_todoList.indexOf(oldData)] = Todo.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _showTodoList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //TODO: Adding
        },
        tooltip: 'Adding to-do',
      ),
    );
  }

  Widget _showTodoList() {
    if (_todoList.length >= 0) {
      return ListView.builder(
        itemBuilder: (context, index) {
          String todoKey = _todoList[index].key;
          String subject = _todoList[index].subject;
          String updateData = _todoList[index].updateData;
          bool isComplete = _todoList[index].completed;

          return Dismissible(
            background: Container(
              color: Colors.redAccent,
            ),
            child: ListTile(
              title: Text(
                subject,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                updateData,
                style: TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                  icon: (isComplete)
                      ? Icon(
                          Icons.done_outline,
                          color: Colors.green,
                          size: 20,
                        )
                      : Icon(
                          Icons.done,
                          color: Colors.grey,
                          size: 20,
                        ),
                  onPressed: () {
                    //TODO: update
                  }),
            ),
            key: Key(todoKey),
            onDismissed: (direction) async {
              //TODO: delete
            },
          );
        },
        itemCount: _todoList.length,
        shrinkWrap: true,
      );
    } else {
      return Center(
        child: Text(
          "Your To-Do list is empty",
          style: TextStyle(
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  @override
  void dispose() {
    _onAddedTodo.cancel();
    _onChangedTodo.cancel();
    super.dispose();
  }
}
