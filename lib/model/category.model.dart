import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class Category {
  Category({
    this.id,
    required this.name,
    required this.emoji,
    this.todoSize,
  });

  final String? id;
  final String name;
  final Emoji emoji;
  final int? todoSize;

  Category.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        name = snapshot.data()!['name'],
        emoji = EmojiParser().get(snapshot.data()!['emoji']),
        todoSize = (snapshot.data()!['todoSize'] ?? 0);

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
