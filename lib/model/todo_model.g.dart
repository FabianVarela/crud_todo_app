// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
  subject: json['subject'] as String,
  finalDate: Todo._intFromJson((json['finalDate'] as num).toInt()),
  categoryId: json['categoryId'] as String,
  id: json['id'] as String?,
  isCompleted: json['isCompleted'] as bool? ?? false,
);

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
  'id': ?instance.id,
  'subject': instance.subject,
  'finalDate': Todo._intToJson(instance.finalDate),
  'categoryId': instance.categoryId,
  'isCompleted': instance.isCompleted,
};
