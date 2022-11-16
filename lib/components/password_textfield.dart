import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, this.width, this.hint, this.controller, this.maxLength, this.textInputType}) : super(key: key);
  final double? width;
  final String? hint;
  final TextEditingController? controller;
  final int? maxLength;
  final TextInputType? textInputType;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0xFFEEECEC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          TextFormField(
            controller: widget.controller,
            maxLength: widget.maxLength,
            keyboardType: widget.textInputType,
            obscureText: !isShow,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              hintText: widget.hint,
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
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 15.sp),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isShow = !isShow;
                  });
                },
                child: Icon(
                  isShow ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
