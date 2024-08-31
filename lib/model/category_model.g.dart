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

Map<String, dynamic> _$CategoryToJson(Category instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['emoji'] = Category._emojiToJson(instance.emoji);
  val['todoSize'] = instance.todoSize;
  return val;
}
