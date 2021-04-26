import 'package:intl/intl.dart';

class Date{

  static String formatDate(DateTime date) {

    var formatter = DateFormat('dd-MM-yyyy');

    String formattedDate = formatter.format(date);

return formattedDate;
  }
}