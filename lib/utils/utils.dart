import 'package:intl/intl.dart';

String dateFormatted() {
  var now = DateTime.now();
  var formatter = DateFormat("EEE, MMM d, ''yy");

  String formatted = formatter.format(now);
  return formatted;
}