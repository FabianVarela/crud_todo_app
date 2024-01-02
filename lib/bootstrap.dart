import 'dart:async';
import 'dart:developer';

import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_size/window_size.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
  FirebaseOptions options,
) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(options: options);

      if (getDevice() == DeviceSegment.desktop) {
        setWindowMinSize(const Size(300, 500));
        setWindowMaxSize(const Size(1500, 900));
      }

      runApp(ProviderScope(child: await builder()));
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
