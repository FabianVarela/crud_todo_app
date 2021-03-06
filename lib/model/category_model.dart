import 'package:equatable/equatable.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class Category extends Equatable {
  const Category({
    this.id,
    required this.name,
    required this.emoji,
    this.todoSize,
  });

  Category.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        emoji = EmojiParser().get(map['emoji']),
        todoSize = map['todoSize'] ?? 0;

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

  @override
  List<Object?> get props => [id, name, emoji, todoSize];
}
