import 'package:crud_todo_app/provider_dependency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: TodoListApp()));
}

class TodoListApp extends ConsumerWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _todoRouterDelegate = ref.watch(crudTodoRouterDelegateProvider);
    final _todoInfoParser = ref.watch(crudTodoInformationParserProvider);

    return MaterialApp.router(
      title: 'To-Do List App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routerDelegate: _todoRouterDelegate,
      routeInformationParser: _todoInfoParser,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
