import 'package:crud_todo_app/app.dart';
import 'package:crud_todo_app/bootstrap.dart';
import 'package:crud_todo_app/firebase_options.dart';

void main() {
  bootstrap(
    () async => const TodoApp(title: 'To-Do List App'),
    DefaultFirebaseOptions.currentPlatform,
    'to-do-app',
  );
}
