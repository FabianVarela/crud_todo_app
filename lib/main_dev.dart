import 'package:crud_todo_app/app.dart';
import 'package:crud_todo_app/bootstrap.dart';
import 'package:crud_todo_app/firebase_options_dev.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  bootstrap(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return const TodoApp(title: 'To-Do List App - Dev');
  });
}
