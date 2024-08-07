import 'package:crud_todo_app/app.dart';
import 'package:crud_todo_app/bootstrap.dart';
import 'package:crud_todo_app/firebase_options_dev.dart';

void main() {
  bootstrap(
    () async => const TodoApp(title: 'To-Do List App - Dev'),
    DefaultFirebaseOptions.currentPlatform,
    'to-do-app_dev',
  );
}
