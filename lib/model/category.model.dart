import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class Category {
  Category({this.id, this.name, this.emoji});

  final String id;
  final String name;
  final Emoji emoji;

  Category.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        name = snapshot.data()['name'],
        emoji = EmojiParser().get(snapshot.data()['emoji']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'emoji': emoji.full,
      };

  Category copyWith({String id, String name, Emoji emoji}) => Category(
        id: id ?? this.id,
        name: name ?? this.name,
        emoji: emoji ?? this.emoji,
      );
}
