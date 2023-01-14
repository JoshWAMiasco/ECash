import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/image.dart';
import 'package:ecash/pages/bookkeeping_page.dart';
import 'package:ecash/pages/demo_page.dart';
import 'package:ecash/pages/home_page.dart';
import 'package:ecash/pages/my_order_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColor.background,
            child: Padding(
              padding: EdgeInsets.only(
                left: 17.sp,
                right: 17.sp,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  PrimaryButton(
                    title: 'Bookkeeping',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookKeepingPage()));
                    },
                  ),
                  PrimaryButton(
                    title: 'POS',
                    onPressed: () {},
                  ),
                  PrimaryButton(
                    title: 'Inventory',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
