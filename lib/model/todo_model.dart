import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/common/utils.dart';

class Todo {
  Todo({
    required this.id,
    required this.subject,
    required this.finalDate,
    required this.categoryId,
    this.isCompleted = false,
  });

  final String id;
  final String subject;
  final DateTime finalDate;
  final String categoryId;
  final bool isCompleted;

  Todo.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        subject = snapshot.data()!['subject'],
        finalDate = (snapshot.data()!['finalDate'] as int).millisecondsToDate,
        categoryId = snapshot.data()!['categoryId'],
        isCompleted = snapshot.data()!['isCompleted'];

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
}
