import 'package:auto_route/auto_route.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void messageDialog(BuildContext context, {String? title, String? content}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.fromLTRB(
            10.w,
            30.h,
            10.w,
            35.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.sp),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(17.sp),
                ),
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? 'Alert',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      content ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => context.router.pop(),
                        style: TextButton.styleFrom(
                            backgroundColor: AppColor.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            )),
                        child: Text(
                          'Okay',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 15.sp,
                right: 15.sp,
                child: SvgPicture.asset(
                  flakesIcon,
                  height: 30.sp,
                  width: 30.sp,
                ),
              ),
            ],
          ),
        );
      });
}
