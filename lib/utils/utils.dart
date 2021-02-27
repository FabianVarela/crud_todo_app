import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String get dateTimeToFormattedString =>
      DateFormat("EEE, MMM d, ''yy - HH:mm").format(this);
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
