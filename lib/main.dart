import 'dart:async';

import 'package:crud_todo_app/app.dart';
import 'package:crud_todo_app/bootstrap.dart';
import 'package:crud_todo_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await bootstrap(
    () => const TodoApp(title: 'To-Do List App'),
  );
}
