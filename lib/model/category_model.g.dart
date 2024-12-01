// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name'] as String,
      emoji: Category._emojiFromJson(json['emoji'] as String),
      id: json['id'] as String?,
      todoSize: (json['todoSize'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'name': instance.name,
      'emoji': Category._emojiToJson(instance.emoji),
      'todoSize': instance.todoSize,
    };
