import 'package:ecash/constants/constants.dart';
import 'package:encrypt/encrypt.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static String moneyFormatter(double number) {
    var f = NumberFormat("###,###,###.##");
    return f.format(number);
  }

  static String shortDateFormatter(DateTime date) {
    String month = date.month.toString().length > 1 ? date.month.toString() : '0${date.month}';
    String day = date.day.toString().length > 1 ? date.day.toString() : '0${date.day}';
    String year = date.year.toString().substring(2, 4);
    return '$month / $day / $year';
  }

  static String dateFormatter(DateTime date) {
    var f = DateFormat("MMMM d,y");
    return f.format(date);
  }

  static String mobileFormatter(String mobile) {
    var f = NumberFormat("+63 ##-###-####-###");
    return f.format(int.parse(mobile.substring(1, 9)));
  }

  static String encryptPassword(String password) {
    final plainText = password;
    final key = Key.fromUtf8(Constants.regKey);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
    print(encrypted.base64);
    return encrypted.base64;
  }
}
