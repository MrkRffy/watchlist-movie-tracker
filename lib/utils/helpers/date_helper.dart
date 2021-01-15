import 'package:intl/intl.dart';

class DateHelper {
  String format(String dateString, String format) {
    DateTime date = DateFormat(format).parse(dateString);
    String formattedDate = DateFormat(format).format(date);

    return formattedDate;
  }

  String getYear(String dateString) {
    DateTime date = DateFormat('YYYY').parse(dateString);
    String formattedDate = DateFormat('YYYY').format(date);

    return formattedDate;
  }

  static String getTextualDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('LLL dd, yyyy').format(date);

    return formattedDate;
  }
}
