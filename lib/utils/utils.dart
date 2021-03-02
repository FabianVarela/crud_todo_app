import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String get dateTimeToFormattedString =>
      DateFormat("MMM d, ''yy - HH:mm").format(this);

  String get timeDateToFormattedString =>
      DateFormat('HH:mm - MMMM d').format(this);

  String get timeFormattedString => DateFormat('HH:mm').format(this);

  bool get isDurationNegative => difference(DateTime.now()).isNegative;

  bool get isToday => difference(DateTime.now()).inDays == 0;
}

extension IntUtils on int {
  DateTime get millisecondsToDate => DateTime.fromMillisecondsSinceEpoch(this);
}

extension StringUtils on String {
  bool get verifyEmoji {
    for (final s in EmojiParser().unemojify(this).split(' ')) {
      return s.startsWith(':') || s.endsWith(':');
    }

    return false;
  }
}

extension WidgetUtils on Widget {
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget paddingHorizontal(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  Widget paddingVertical(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  Widget paddingSymmetric(double hori, double vert) => Padding(
        padding: EdgeInsets.symmetric(horizontal: hori, vertical: vert),
        child: this,
      );
}
