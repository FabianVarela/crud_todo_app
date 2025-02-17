import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_size/window_size.dart';

final class TodoApp extends ConsumerWidget {
  const TodoApp({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoRouterDelegate = ref.watch(crudTodoRouterDelegateProvider);
    final todoInfoParser = ref.watch(crudTodoInformationParserProvider);

    return MaterialApp.router(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      onGenerateTitle: (_) {
        if (currentDevice == DeviceSegment.desktop) setWindowTitle(title);
        return title;
      },
      routerDelegate: todoRouterDelegate,
      routeInformationParser: todoInfoParser,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
