import 'package:flutter/material.dart';

final class CustomMouseRegion extends StatelessWidget {
  const CustomMouseRegion({
    required this.child,
    this.cursor = SystemMouseCursors.none,
    this.isForDesktop = false,
    this.tooltipMessage,
    super.key,
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
