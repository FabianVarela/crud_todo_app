import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/database/todo.database.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> setupInject() async {
  _loadPackages();
  _loadDatabase();
}

void _loadPackages() {
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
}

void _loadDatabase() {
  getIt.registerLazySingleton<ITodoDatabase>(
      () => TodoDatabase(getIt<FirebaseFirestore>()));
}
