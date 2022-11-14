import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

void messageDialog(BuildContext context, {String? title, String? content}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title ?? 'Alert',
        ),
        content: Text(
          content ?? ''
        ),
        actions: [
          TextButton(
            onPressed: (){
              AutoRouter.of(context).pop();
            },
            child: const Text('Got it')
          )
        ],
      );
    }
  );
}