import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ecash/components/cart_card.dart';
import 'package:ecash/components/no_cart_placeholder.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 17.sp, right: 17.sp),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CartCard(),
                  //NoCartPlaceHolder(),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 30.sp,
                width: 90.w,
                margin: EdgeInsets.only(
                  bottom: 3.h,
                ),
                padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 10.sp, 10.sp),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: AppColor.secondary,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          '₱ 20,000.00',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 28.sp,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: AppColor.secondary,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.sp, 5.h, 20.sp, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.router.pop();
                    },
                    child: Container(
                      height: 5.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.sp),
                          bottomRight: Radius.circular(15.sp),
                        ),
                        color: AppColor.primary,
                      ),
                      padding: EdgeInsets.all(10.sp),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Cart',
                    style: GoogleFonts.charmonman(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                      fontSize: 22.sp,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
