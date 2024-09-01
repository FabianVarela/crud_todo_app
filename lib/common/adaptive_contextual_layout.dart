import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScreenType { desktop, tablet, handset, watch }

ScreenType getFormFactor(BuildContext context) {
  return switch (MediaQuery.sizeOf(context).shortestSide) {
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

DeviceSegment get currentDevice {
  return switch (defaultTargetPlatform) {
    TargetPlatform.android ||
    TargetPlatform.iOS =>
      kIsWeb ? DeviceSegment.mobileWeb : DeviceSegment.mobile,
    TargetPlatform.windows ||
    TargetPlatform.linux ||
    TargetPlatform.macOS =>
      kIsWeb ? DeviceSegment.desktopWeb : DeviceSegment.desktop,
    _ => DeviceSegment.other,
  };
}

bool isPortrait(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait;
