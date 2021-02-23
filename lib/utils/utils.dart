import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String get dateTimeToFormattedString =>
      DateFormat("EEE, MMM d, ''yy - HH:mm").format(this);
}

extension IntUtils on int {
  DateTime get millisecondsToDate => DateTime.fromMillisecondsSinceEpoch(this);
}
