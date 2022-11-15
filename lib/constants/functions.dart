import 'package:intl/intl.dart';

String moneyFormatter(double number) {
  var f = NumberFormat("###,###,###.##");
  return f.format(number);
}

String shortDateFormatter(DateTime date) {
  String month = date.month.toString().length > 1 ? date.month.toString() : '0' + date.month.toString();
  String day = date.day.toString().length > 1 ? date.day.toString() : '0' + date.day.toString();
  String year = date.year.toString().substring(2, 4);
  return month + ' / ' + day + ' / ' + year;
}

String dateFormatter(DateTime date) {
  var f = DateFormat("MMMM d,y");
  return f.format(date);
}

String mobileFormatter(String mobile) {
  var f = NumberFormat("+63 ##-###-####-###");
  return f.format(int.parse(mobile.substring(1, 9)));
}
