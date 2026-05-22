import 'dart:async';
import 'dart:developer';

import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
  FirebaseOptions options,
  String appName,
) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(() async {
    usePathUrlStrategy();
    WidgetsFlutterBinding.ensureInitialized();

    if (!kIsWeb && currentDevice == .desktop) {
      await windowManager.ensureInitialized();
    }

    final isWindows = defaultTargetPlatform == TargetPlatform.windows;
    await Firebase.initializeApp(
      options: options,
      name: (!kIsWeb && !isWindows) ? appName : null,
    );

    if (!kIsWeb && currentDevice == .desktop) {
      await windowManager.setMinimumSize(const Size(300, 500));
      await windowManager.setMaximumSize(const Size(1500, 900));
    }

    runApp(ProviderScope(child: await builder()));
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
