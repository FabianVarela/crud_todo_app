/// Temporal file for migrating to `WidgetReference` syntax in the
/// becoming `riverpod` version.
///
/// See the new RFC and the implementation (WIP)
/// - RFC: https://github.com/rrousselGit/river_pod/issues/335
/// - PR: https://github.com/rrousselGit/river_pod/pull/462
///
/// Medium article about the usage: https://link.medium.com/4F5gdDISXfb
library temporal_widget_reference_migration;

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show BuildContextX, RootProvider, ProviderListenable, useProvider;
import 'package:hooks_riverpod/hooks_riverpod.dart' as hr;

export 'package:hooks_riverpod/hooks_riverpod.dart'
    hide BuildContextX, RootProvider, ProviderListenable, useProvider;

typedef ConsumerBuilder = Widget Function(
    BuildContext, WidgetReference, Widget?);

class WidgetReference {
  const WidgetReference(this.context, this.watch);

  final BuildContext context;
  final T Function<T>(ProviderListenable<T>) watch;

  T read<T>(RootProvider<Object?, T> provider) => context.read(provider);

  Created refresh<Created>(RootProvider<Created, Object> provider) {
    return context.refresh(provider);
  }
}

abstract class ConsumerWidget extends StatefulHookWidget {
  const ConsumerWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context, WidgetReference ref);

  @override
  _ConsumerState createState() => _ConsumerState();
}

class _ConsumerState extends State<ConsumerWidget> {
  @override
  Widget build(BuildContext context) {
    final ref = WidgetReference(context, useProvider);
    return widget.build(context, ref);
  }
}

class Consumer extends ConsumerWidget {
  const Consumer({Key? key, required this.builder, this.child})
      : super(key: key);

  final ConsumerBuilder builder;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    return builder(context, ref, child);
  }
}

abstract class HookConsumerWidget extends ConsumerWidget {
  const HookConsumerWidget({Key? key}) : super(key: key);
}

class HookConsumer extends ConsumerWidget {
  const HookConsumer({Key? key, required this.builder, this.child})
      : super(key: key);

  final ConsumerBuilder builder;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    return builder(context, ref, child);
  }
}
