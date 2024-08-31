import 'package:flutter/material.dart';

class ScaleTransitionRoute<T> extends PageRouteBuilder<T> {
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

class FadeTransitionRoute<T> extends PageRouteBuilder<T> {
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

class SlideTransitionRoute<T> extends PageRouteBuilder<T> {
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
