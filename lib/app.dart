import 'dart:async';

import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:window_manager/window_manager.dart';

final class TodoApp extends ConsumerWidget {
  const new({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoRouterDelegate = ref.watch(crudTodoRouterDelegateProvider);
    final todoInfoParser = ref.watch(crudTodoInformationParserProvider);

    return MaterialApp.router(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // TODO(FV): Wait for https://github.com/flutter/packages/pull/12489
        // textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      onGenerateTitle: (_) {
        if (!kIsWeb && currentDevice == .desktop) {
          unawaited(windowManager.setTitle(title));
        }
        return title;
      },
      routerDelegate: todoRouterDelegate,
      routeInformationParser: todoInfoParser,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
