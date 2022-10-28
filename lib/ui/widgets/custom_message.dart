import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void showCustomMessage(BuildContext context, String message) {
  if (desktopSegments.contains(getDevice())) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final actions = <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('OK'),
          )
        ];

        return defaultTargetPlatform == TargetPlatform.macOS
            ? CupertinoAlertDialog(title: Text(message), actions: actions)
            : AlertDialog(title: Text(message), actions: actions);
      },
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
