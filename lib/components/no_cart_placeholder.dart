import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoCartPlaceHolder extends StatelessWidget {
  const NoCartPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: const AssetImage(
            expressoImage,
          ),
          height: 40.h,
          width: 80.w,
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cart Empty',
                style: GoogleFonts.charmonman(
                  fontWeight: FontWeight.bold,
                  fontSize: 23.sp,
                  color: AppColor.primary,
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
