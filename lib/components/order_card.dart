import 'package:dotted_line/dotted_line.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColor.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      margin: EdgeInsets.only(left: 5.w, right: 5.w),
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order#: AM001',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Column(
                  children: [
                    Chip(
                      padding: EdgeInsets.zero,
                      label: Text(
                        'To Pay',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: AppColor.secondary,
                    ),
                    Text(
                      '₱ 200.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            DottedLine(
              dashColor: Colors.white,
              lineLength: double.infinity,
              direction: Axis.horizontal,
              lineThickness: 2.sp,
              dashLength: 2.w,
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Container(
                  height: 20.sp,
                  width: 20.sp,
                  margin: EdgeInsets.only(right: 10.sp),
                  decoration: BoxDecoration(
                    color: AppColor.ligthBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '99',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                  ),
                ),
                Text(
                  'Classic - Brewed ( Strong ) 8oz',
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 20.sp,
                  width: 20.sp,
                  margin: EdgeInsets.only(right: 10.sp),
                  decoration: BoxDecoration(
                    color: AppColor.ligthBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '99',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                  ),
                ),
                Text(
                  'Classic - Brewed ( Strong ) 8oz',
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ],
            ),
            Text(
              'Classic - Brewed ( Strong ) 8oz',
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
            Text(
              'Classic - Brewed ( Strong ) 8oz',
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
