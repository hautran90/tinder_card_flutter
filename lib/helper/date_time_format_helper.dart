import 'package:intl/intl.dart';

class DateTimeFormatHelper {
  static String formatTimestamp(int time) {
    var parsedDate = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    var formatter = new DateFormat('MMMM dd, yyyy');
    String formatted = formatter.format(parsedDate);
    return formatted;
  }
}
