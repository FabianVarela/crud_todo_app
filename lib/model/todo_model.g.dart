// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      id: json['id'] as String?,
      subject: json['subject'] as String,
      finalDate: Todo._intFromJson(json['finalDate'] as int),
      categoryId: json['categoryId'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$TodoToJson(Todo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['subject'] = instance.subject;
  val['finalDate'] = Todo._intToJson(instance.finalDate);
  val['categoryId'] = instance.categoryId;
  val['isCompleted'] = instance.isCompleted;
  return val;
}
