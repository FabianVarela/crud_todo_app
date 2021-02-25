import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/utils/utils.dart';

class Todo {
  Todo({
    this.id,
    this.subject,
    this.isCompleted,
    this.finalDate,
    this.categoryId,
  });

  final String id;
  final String subject;
  final bool isCompleted;
  final DateTime finalDate;
  final String categoryId;

  Todo.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.data()['id'],
        subject = snapshot.data()['subject'],
        isCompleted = snapshot.data()['isCompleted'],
        finalDate = (snapshot.data()['finalDate'] as int).millisecondsToDate,
        categoryId = snapshot.data()['categoryId'];

  Map<String, dynamic> toJson() => {
        'subject': subject,
        'isCompleted': isCompleted,
        'finalDate': finalDate.millisecondsSinceEpoch,
        'categoryId': categoryId,
      };

  Todo copyWith({
    String id,
    String subject,
    bool isCompleted,
    DateTime finalDate,
    String categoryId,
  }) =>
      Todo(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        isCompleted: isCompleted ?? this.isCompleted,
        finalDate: finalDate ?? this.finalDate,
        categoryId: categoryId ?? this.categoryId,
      );
}
