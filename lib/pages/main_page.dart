import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/image.dart';
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
  final PageController _pageController = PageController(initialPage: 0);
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: const [HomePage(), MyOrderPage()],
          ),
          Positioned(
            bottom: 5.h,
            right: -1.sp,
            child: Container(
              height: 10.h,
              width: 50.w,
              decoration: const BoxDecoration(color: Color(0xFF4F4D4D), borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      splashColor: AppColor.secondary,
                      onTap: () {
                        _pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.ease);
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                      child: Column(
                        children: [
                          ImageIcon(
                            AssetImage(storeIcon),
                            size: 25.sp,
                            color: pageIndex == 0 ? Colors.white : Colors.white30,
                          ),
                          Text(
                            'Store',
                            style: TextStyle(fontWeight: FontWeight.bold, color: pageIndex == 0 ? Colors.white : Colors.white30, fontSize: 15.sp),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: AppColor.secondary,
                      onTap: () {
                        _pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.ease);
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 9.sp),
                            child: ImageIcon(
                              AssetImage(orderIcon),
                              size: 22.sp,
                              color: pageIndex == 1 ? Colors.white : Colors.white30,
                            ),
                          ),
                          SizedBox(
                            height: 7.5.sp,
                          ),
                          Text(
                            'My Order',
                            style: TextStyle(fontWeight: FontWeight.bold, color: pageIndex == 1 ? Colors.white : Colors.white30, fontSize: 15.sp),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
