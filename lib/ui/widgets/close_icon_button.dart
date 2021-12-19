import 'package:flutter/material.dart';

class CloseIconButton extends StatelessWidget {
  const CloseIconButton({
    Key? key,
    required this.onClick,
    this.isDesktop = false,
  }) : super(key: key);

  final VoidCallback onClick;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final closeButton = GestureDetector(
      onTap: onClick,
      child: const Icon(Icons.close, color: Colors.white),
    );

    return isDesktop
        ? MouseRegion(cursor: SystemMouseCursors.click, child: closeButton)
        : closeButton;
  }
}
