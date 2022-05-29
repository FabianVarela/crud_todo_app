import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:crud_todo_app/navigator/crud_todo_information_parser.dart';
import 'package:crud_todo_app/navigator/crud_todo_router_delegate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_size/window_size.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (getDevice() == DeviceSegment.desktop) {
    setWindowMinSize(const Size(300, 500));
    setWindowMaxSize(const Size(1500, 900));
  }

  runApp(const ProviderScope(child: TodoListApp()));
}

class TodoListApp extends StatefulWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  final _todoRouterDelegate = CrudTodoRouterDelegate();
  final _todoInfoParser = CrudTodoInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      onGenerateTitle: (ctx) {
        const title = 'To-Do List App';
        if (getDevice() == DeviceSegment.desktop) setWindowTitle(title);

        return title;
      },
      routerDelegate: _todoRouterDelegate,
      routeInformationParser: _todoInfoParser,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
