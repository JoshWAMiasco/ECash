import 'package:flutter/material.dart';

class AppFont {
  static TextStyle bold({Color color, double fontSize, TextDecoration decoration}) {
    return TextStyle(
      fontFamily: 'Cabin-Bold',
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      decoration: decoration,
    );
  }

  static TextStyle regular({Color color, double fontSize, TextDecoration decoration}) {
    return TextStyle(
      fontFamily: 'Cabin-Regular',
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      decoration: decoration,
    );
  }

  static TextStyle semiBold({Color color, double fontSize, TextDecoration decoration}) {
    return TextStyle(
      fontFamily: 'Cabin-SemiBold',
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      decoration: decoration,
    );
  }
}
