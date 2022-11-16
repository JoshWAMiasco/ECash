import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.sp),
      height: 43.sp,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.sp),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            padding: EdgeInsets.fromLTRB(32.w, 10.sp, 10.sp, 10.sp),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Size: 8oz',
                    ),
                    Text(
                      'Price: ₱ 100.00',
                    )
                  ],
                ),
                const Spacer(),
                DottedLine(
                  direction: Axis.vertical,
                  lineLength: double.infinity,
                  dashColor: AppColor.primary,
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Text(
                  '₱ 100.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                    fontSize: 18.sp,
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/200/300',
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: 40.sp,
                          width: 40.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: AppColor.primary,
                                width: 5.sp,
                              )),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 1.sp,
                      left: 2.sp,
                      child: Container(
                        height: 20.sp,
                        width: 20.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.primary,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.sp, top: 20.sp),
                child: Text(
                  'Classic - Strong Brewed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: AppColor.primary,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
