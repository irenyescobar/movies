import 'package:intl/intl.dart';

extension DateParsing on DateTime {
  String formattedString() {
    return DateFormat.yMMMd().format(this);
  }
}
