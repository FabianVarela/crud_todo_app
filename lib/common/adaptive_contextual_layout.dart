import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScreenType { desktop, tablet, handset, watch }

ScreenType getFormFactor(BuildContext context) {
  return switch (MediaQuery.of(context).size.shortestSide) {
    > 900 => ScreenType.desktop,
    > 600 => ScreenType.tablet,
    > 300 => ScreenType.handset,
    _ => ScreenType.watch
  };
}

enum DeviceSegment { mobile, desktop, mobileWeb, desktopWeb, other }

List<DeviceSegment> desktopSegments = [
  DeviceSegment.desktop,
  DeviceSegment.desktopWeb,
];

List<DeviceSegment> webSegments = [
  DeviceSegment.mobileWeb,
  DeviceSegment.desktopWeb,
];

DeviceSegment getDevice() {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android || TargetPlatform.iOS:
      return kIsWeb ? DeviceSegment.mobileWeb : DeviceSegment.mobile;
    case TargetPlatform.windows || TargetPlatform.linux || TargetPlatform.macOS:
      return kIsWeb ? DeviceSegment.desktopWeb : DeviceSegment.desktop;
    default:
      return DeviceSegment.other;
  }
}

bool isPortrait(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait;
