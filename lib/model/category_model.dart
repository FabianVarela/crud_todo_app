import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class Category {
  Category({
    this.id,
    required this.name,
    required this.emoji,
    this.todoSize,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      emoji: map['emoji'],
      todoSize: map['todoSize'],
    );
  }

  Category.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        name = snapshot.data()!['name'],
        emoji = EmojiParser().get(snapshot.data()!['emoji']),
        todoSize = (snapshot.data()!['todoSize'] ?? 0);

  final String? id;
  final String name;
  final Emoji emoji;
  final int? todoSize;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'emoji': emoji.full,
        'todoSize': todoSize ?? 0
      };

  Category copyWith({String? id, String? name, Emoji? emoji, int? todoSize}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        emoji: emoji ?? this.emoji,
        todoSize: todoSize ?? this.todoSize,
      );
}
