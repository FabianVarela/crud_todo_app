import 'package:flutter/material.dart';

class ScaleTransitionRoute extends PageRouteBuilder<void> {
  ScaleTransitionRoute({
    required RouteSettings settings,
    required this.child,
  }) : super(
          settings: settings,
          pageBuilder: (_, anim, __) => ScaleTransition(
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
          pageBuilder: (_, anim, __) => FadeTransition(
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
          pageBuilder: (_, anim, __) => SlideTransition(
            position: anim.drive(CurveTween(curve: Curves.easeInOut)).drive(
                  Tween(begin: const Offset(0, 1), end: Offset.zero),
                ),
            child: child,
          ),
        );

  final Widget child;
}
