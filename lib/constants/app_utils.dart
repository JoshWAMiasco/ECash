import 'dart:io';

import 'package:ecash/constants/constants.dart';
import 'package:encrypt/encrypt.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static String moneyFormatter(double number) {
    var f = NumberFormat("###,###,###.##");
    return f.format(number);
  }

  static String pointsFormatter(int points) {
    var f = NumberFormat('###,###,###');
    return f.format(points);
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

  static String encrypt(String password) {
    final plainText = password;
    final key = Key.fromUtf8(Constants.regKey);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return encrypted.base64;
  }

  static String getOrderStatus(String status){
    switch (status) {
      case 'toPay':
        return "To Pay";
      case 'paid':
        return "Paid";
      case 'preparing':
        return "Preparing";
      case 'ready':
        return "Ready";
      default:
        return "";
    }
  }

  static bool isAm() {
    var f = DateFormat.jm();
    var now = f.format(DateTime.now());
    if(now.contains('AM')){
      return true;
    } else {
      return false;
    }
  }

  Future<String?> uploadFile({File? file, String? fileName, String? path}) async {
    try {
      if (file != null && fileName != null && path != null) {
        TaskSnapshot taskSnapshot = await FirebaseStorage.instance.ref().child("$path/$fileName").putFile(file);
        if (taskSnapshot.state == TaskState.success) {
          String url = await taskSnapshot.ref.getDownloadURL();
          return url;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } on FirebaseException {
      return null;
    }
  }
}
