import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({Key? key, this.width, this.hint, this.controller, this.maxLength, this.textInputType}) : super(key: key);
  final double? width;
  final String? hint;
  final TextEditingController? controller;
  final int? maxLength;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0xFFEEECEC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),
          counterText: "",
          contentPadding: EdgeInsets.only(
            left: 10,
            bottom: 10,
          ),
        ),
        style: TextStyle(color: AppColor.primary, fontWeight: FontWeight.bold, fontSize: 17.sp),
      ),
    );
  }
}
