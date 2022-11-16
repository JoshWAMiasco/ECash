import 'package:ecash/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void loadingIndicator(BuildContext context, {String? title, String? content}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.3,
          MediaQuery.of(context).size.height * 0.4,
          MediaQuery.of(context).size.width * 0.3,
          MediaQuery.of(context).size.height * 0.4,
        ),
        contentPadding: EdgeInsets.zero,
        content: Center(
          child: Lottie.asset(
            coffeeLoading,
          ),
        ),
      );
    },
  );
}
