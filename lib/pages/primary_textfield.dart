import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    Key? key,
    this.width,
    this.hint,
    this.controller,
    this.maxLength,
    this.textInputType,
    this.onChange,
    this.height,
    this.maxLines,
  }) : super(key: key);
  final double? width;
  final String? hint;
  final TextEditingController? controller;
  final int? maxLength;
  final TextInputType? textInputType;
  final Function(String)? onChange;
  final double? height;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 28.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onChanged: onChange,
        controller: controller,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 17.sp,
          ),
          counterText: "",
          contentPadding: EdgeInsets.only(
            left: 10,
            bottom: 10,
          ),
        ),
        style: TextStyle(
            color: AppColor.primary,
            fontWeight: FontWeight.bold,
            fontSize: 17.sp),
      ),
    );
  }
}
