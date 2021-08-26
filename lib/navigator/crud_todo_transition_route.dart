
import 'package:flutter/material.dart';

class ScaleTransitionRoute extends PageRouteBuilder<void> {
  ScaleTransitionRoute({
    required RouteSettings settings,
    required this.child,
  }) : super(
    settings: settings,
    // reverseTransitionDuration: const Duration(milliseconds: 1000),
    // transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (context, anim, anim2) => ScaleTransition(
      scale: anim,
      child: child,
    ),
  );

  final Widget child;
}

class FadeTransitionRoute extends PageRouteBuilder<void> {
  FadeTransitionRoute({
    required RouteSettings settings,
    required this.child,
  }) : super(
    settings: settings,
    reverseTransitionDuration: const Duration(milliseconds: 1000),
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (context, anim, anim2) => FadeTransition(
      opacity: anim,
      child: child,
    ),
  );

  final Widget child;
}

class SlideTransitionRoute extends PageRouteBuilder<void> {
  SlideTransitionRoute({
    required RouteSettings settings,
    required this.child,
  }) : super(
    settings: settings,
    reverseTransitionDuration: const Duration(milliseconds: 1000),
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (context, anim, anim2) {
      final tween = Tween(
        begin: const Offset(0, 1),
        end: Offset.zero,
      );
      final curveTween = CurveTween(curve: Curves.easeInOut);
      return SlideTransition(
        position: anim.drive(curveTween).drive(tween),
        child: child,
      );
    },
  );

  final Widget child;
}
