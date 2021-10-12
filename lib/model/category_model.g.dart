// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as String?,
    name: json['name'] as String,
    emoji: _emojiFromJson(json['emoji'] as String),
    todoSize: json['todoSize'] as int,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['emoji'] = _emojiToJson(instance.emoji);
  val['todoSize'] = instance.todoSize;
  return val;
}
