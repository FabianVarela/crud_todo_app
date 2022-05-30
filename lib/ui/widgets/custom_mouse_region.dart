import 'package:flutter/material.dart';

class CustomMouseRegion extends StatelessWidget {
  const CustomMouseRegion({
    super.key,
    required this.child,
    this.cursor = SystemMouseCursors.none,
    this.isForDesktop = false,
    this.tooltipMessage,
  });

  final Widget child;
  final MouseCursor cursor;
  final bool isForDesktop;
  final String? tooltipMessage;

  @override
  Widget build(BuildContext context) {
    return isForDesktop
        ? MouseRegion(
            cursor: cursor,
            child: tooltipMessage != null
                ? Tooltip(message: tooltipMessage, child: child)
                : child,
          )
        : child;
  }
}
