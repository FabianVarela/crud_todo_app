import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

Future<void> showCustomMessage(
  BuildContext context, {
  required String message,
}) async {
  if (desktopSegments.contains(currentDevice)) {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final actions = <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('OK'),
          ),
        ];

        return defaultTargetPlatform == .macOS
            ? CupertinoAlertDialog(title: Text(message), actions: actions)
            : AlertDialog(title: Text(message), actions: actions);
      },
    );
  } else {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
