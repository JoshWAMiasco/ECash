import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      this.onPressed,
      this.title,
      this.backgroundColor,
      this.titleColor})
      : super(key: key);
  final VoidCallback? onPressed;
  final String? title;
  final Color? backgroundColor;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: onPressed,
        child: Text(
          title ?? '',
          style: TextStyle(
            color: titleColor ?? Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
