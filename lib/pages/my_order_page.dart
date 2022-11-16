import 'package:badges/badges.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ecash/components/no_order_placeholder.dart';
import 'package:ecash/components/order_card.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Text(
                'My Order',
                style: GoogleFonts.charmonman(fontWeight: FontWeight.bold, fontSize: 25.sp, color: AppColor.primary),
              ),
            ),
            SvgPicture.asset(
              classicDivider,
            ),
            SizedBox(
              height: 5.h,
            ),
            OrderCard(),
            //const NoOrderPlaceHolder(),
          ],
        ),
      ),
    );
  }
}
