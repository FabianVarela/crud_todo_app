import 'package:crud_todo_app/utils/utils.dart';

class Todo {
  Todo({
    this.id,
    this.subject,
    this.isCompleted,
    this.finalDate,
  });

  final String id;
  final String subject;
  final bool isCompleted;
  final DateTime finalDate;

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        subject = json['subject'],
        isCompleted = json['isCompleted'],
        finalDate = (json['finalDate'] as int).millisecondsToDate;

  Map<String, dynamic> toJson() => {
        'subject': subject,
        'isCompleted': isCompleted,
        'finalDate': finalDate.millisecondsSinceEpoch,
      };

  Todo copyWith({
    String id,
    String subject,
    bool isCompleted,
    DateTime finalDate,
  }) =>
      Todo(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        isCompleted: isCompleted ?? this.isCompleted,
        finalDate: finalDate ?? this.finalDate,
      );
}
