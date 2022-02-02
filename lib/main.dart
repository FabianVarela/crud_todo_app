import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:crud_todo_app/ui/category_list_view.dart';
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

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      onGenerateTitle: (ctx) {
        if (getDevice() == DeviceSegment.desktop) {
          setWindowTitle('To-Do List App');
        }
        return 'To-Do List App';
      },
      home: const CategoryListView(),
    );
  }
}
