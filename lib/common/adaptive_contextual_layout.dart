import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

enum ScreenType { desktop, tablet, handset, watch }

ScreenType getFormFactor(BuildContext context) {
  final deviceSizeWidth = MediaQuery.of(context).size.shortestSide;

  if (deviceSizeWidth > FormFactor.desktop) return ScreenType.desktop;
  if (deviceSizeWidth > FormFactor.tablet) return ScreenType.tablet;
  if (deviceSizeWidth > FormFactor.handset) return ScreenType.handset;

  return ScreenType.watch;
}

enum DeviceSegment { mobile, desktop, mobileWeb, desktopWeb, other }

DeviceSegment getDevice() {
  final isAndroid = defaultTargetPlatform == TargetPlatform.android;
  final isIOS = defaultTargetPlatform == TargetPlatform.iOS;

  final isWindows = defaultTargetPlatform == TargetPlatform.windows;
  final isLinux = defaultTargetPlatform == TargetPlatform.linux;
  final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;

  final isMobile = isAndroid || isIOS;
  final isDesktop = isWindows || isLinux || isMacOS;

  if (!kIsWeb && isMobile) return DeviceSegment.mobile;
  if (!kIsWeb && isDesktop) return DeviceSegment.desktop;

  if (kIsWeb && isMobile) return DeviceSegment.mobileWeb;
  if (kIsWeb && isDesktop) return DeviceSegment.desktopWeb;

  return DeviceSegment.other;
}

bool isPortrait(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait;
