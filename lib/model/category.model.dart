import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/model/todo.model.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class Category {
  Category({this.id, this.name, this.emoji, this.todos = const <Todo>[]});

  final String id;
  final String name;
  final Emoji emoji;
  final List<Todo> todos;

  Category.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        name = snapshot.data()['name'],
        emoji = EmojiParser().get(snapshot.data()['emoji']),
        todos = snapshot.data()['todos'] != null
            ? (snapshot.data()['todos'] as List)
                .map((item) => Todo.fromJson(item))
                .toList()
            : <Todo>[];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'emoji': emoji.full,
        'todos': todos,
      };

  Category copyWith({String id, String name, Emoji emoji}) => Category(
        id: id ?? this.id,
        name: name ?? this.name,
        emoji: emoji ?? this.emoji,
        todos: todos,
      );
}
