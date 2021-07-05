import 'package:crud_todo_app/common/extension.dart';
import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.subject,
    required this.finalDate,
    required this.categoryId,
    this.isCompleted = false,
  });

  Todo.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        subject = map['subject'],
        finalDate = (map['finalDate'] as int).millisecondsToDate,
        categoryId = map['categoryId'],
        isCompleted = map['isCompleted'];

  final String id;
  final String subject;
  final DateTime finalDate;
  final String categoryId;
  final bool isCompleted;

  Map<String, dynamic> toJson() => {
        'subject': subject,
        'finalDate': finalDate.millisecondsSinceEpoch,
        'categoryId': categoryId,
        'isCompleted': isCompleted,
      };

  Todo copyWith({
    String? id,
    String? subject,
    DateTime? finalDate,
    String? categoryId,
    bool? isCompleted,
  }) =>
      Todo(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        finalDate: finalDate ?? this.finalDate,
        categoryId: categoryId ?? this.categoryId,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  @override
  List<Object?> get props => [id, subject, finalDate, categoryId, isCompleted];
}
