
import 'package:auto_route/auto_route.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BeansWalletNoUSer extends StatelessWidget {
  const BeansWalletNoUSer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 22.h,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.sp),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp), bottomRight: Radius.circular(20.sp)),
                ),
                child: Container(
                  height: 22.h,
                  width: 80.w,
                  decoration: BoxDecoration(color: AppColor.ligthBlue, borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp), bottomRight: Radius.circular(20.sp))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(25.w, 12.sp, 20.sp, 10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Beans Point',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                color: AppColor.primary,
                              ),
                            ),
                            SizedBox(
                              height: 0.1.h,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
                              style: TextStyle(fontSize: 15.sp),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                context.router.pushNamed('/login');
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColor.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.sp),
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.router.pushNamed('/registration');
                              },
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8.w,
              child: SvgPicture.asset(
                cupLogo,
                height: 40.sp,
                width: 40.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
