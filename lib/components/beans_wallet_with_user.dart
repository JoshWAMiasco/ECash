import 'package:auto_route/auto_route.dart';
import 'package:ecash/components/user_profile_modal.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BeansWalletWithUSer extends StatelessWidget {
  const BeansWalletWithUSer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 15.h,
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
                  height: 10.h,
                  width: 80.w,
                  decoration: BoxDecoration(color: AppColor.ligthBlue, borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp), bottomRight: Radius.circular(20.sp))),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(25.w, 12.sp, 20.sp, 12.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
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
                              '10,000,000',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return UserProfileModal();
                              },
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColor.primary,
                            child: Icon(
                              Icons.qr_code_2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
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
