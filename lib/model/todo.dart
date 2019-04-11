import 'package:firebase_database/firebase_database.dart';

class Todo {
  String key;
  String subject;
  bool completed;
  String updateData;

  Todo(this.subject, this.completed);

  Todo.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        subject = snapshot.value["subject"],
        completed = snapshot.value["completed"],
        updateData = snapshot.value["updateData"];

  toJson() {
    return {
      "subject": subject,
      "completed": completed,
      "updateData": updateData
    };
  }
}
