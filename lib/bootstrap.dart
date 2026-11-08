import 'dart:async';
import 'dart:developer';

import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_ui/material_ui.dart';
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
      WindowManager.instance.getCurrent()!
        ..minimumSize = const Size(300, 500).toNative()
        ..maximumSize = const Size(1500, 900).toNative();
    }

    final isWindows = defaultTargetPlatform == .windows;
    await Firebase.initializeApp(
      options: options,
      name: (!kIsWeb && !isWindows) ? appName : null,
    );

    runApp(ProviderScope(child: await builder()));
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
