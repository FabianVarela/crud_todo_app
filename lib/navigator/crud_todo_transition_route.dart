import 'package:flutter/material.dart';

final class SimpleRoute<T> extends PageRouteBuilder<T> {
  SimpleRoute({required RouteSettings super.settings, required this.child})
    : super(pageBuilder: (_, _, _) => child);

  final Widget child;
}

final class ScaleTransitionRoute<T> extends PageRouteBuilder<T> {
  ScaleTransitionRoute({
    required RouteSettings super.settings,
    required this.child,
  }) : super(
         pageBuilder: (_, anim, _) {
           return ScaleTransition(scale: anim, child: child);
         },
       );

  final Widget child;
}

final class FadeTransitionRoute<T> extends PageRouteBuilder<T> {
  FadeTransitionRoute({
    required RouteSettings super.settings,
    required this.child,
  }) : super(
         reverseTransitionDuration: const Duration(milliseconds: 1000),
         transitionDuration: const Duration(milliseconds: 1000),
         pageBuilder: (_, anim, _) {
           return FadeTransition(opacity: anim, child: child);
         },
       );

  final Widget child;
}

final class SlideTransitionRoute<T> extends PageRouteBuilder<T> {
  SlideTransitionRoute({
    required RouteSettings super.settings,
    required this.child,
  }) : super(
         reverseTransitionDuration: const Duration(milliseconds: 1000),
         transitionDuration: const Duration(milliseconds: 1000),
         pageBuilder: (_, anim, _) {
           return SlideTransition(
             position: anim
                 .drive(CurveTween(curve: Curves.easeInOut))
                 .drive(Tween(begin: const Offset(0, 1), end: .zero)),
             child: child,
           );
         },
       );

  final Widget child;
}

final class DialogFadeTransitionRoute<T> extends RawDialogRoute<T> {
  DialogFadeTransitionRoute({
    required RouteSettings super.settings,
    required this.child,
  }) : super(
         barrierDismissible: false,
         transitionDuration: const Duration(milliseconds: 1000),
         pageBuilder: (_, anim, _) {
           return FadeTransition(opacity: anim, child: child);
         },
       );

  final Widget child;
}
