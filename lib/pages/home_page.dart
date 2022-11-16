import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecash/components/beans_wallet_no_user.dart';
import 'package:ecash/components/beans_wallet_with_user.dart';
import 'package:ecash/components/slidable_card.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/banner_data.dart';
import 'package:ecash/constants/image.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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
            Padding(
              padding: EdgeInsets.only(
                right: 5.w,
                left: 5.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Winter Brewed',
                          style: GoogleFonts.charmonman(fontWeight: FontWeight.bold, color: AppColor.primary, fontSize: 22.sp),
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  Badge(
                    badgeContent: const Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                    child: InkWell(
                      onTap: () {
                        context.router.pushNamed('/cart');
                      },
                      child: Container(
                        height: 25.sp,
                        width: 25.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.primary,
                        ),
                        child: Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ref.watch(authProvider.notifier).user == null ? 'Good Morning! ' : 'Good Morning, Joshua!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Builder(
              builder: (context) {
                if (ref.watch(authProvider.notifier).user == null) {
                  return const BeansWalletNoUSer();
                } else {
                  return const BeansWalletWithUSer();
                }
              },
            ),
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Divider(
                    color: AppColor.primary,
                    thickness: 10.sp,
                    indent: 30.w,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Text(
                      'TARA KAPE!',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: AppColor.primary),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Divider(
                    color: AppColor.primary,
                    thickness: 10.sp,
                    indent: 30.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Menu',
                      style: GoogleFonts.charmonman(fontSize: 25.sp, fontWeight: FontWeight.bold, color: AppColor.primary),
                    ),
                    InkWell(
                      onTap: () {
                        context.router.pushNamed('/menu');
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2,
                pauseAutoPlayOnTouch: true,
              ),
              items: List.generate(BannerData.announcement.length, (index) {
                return CachedNetworkImage(
                  imageUrl: BannerData.announcement[index],
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white.withOpacity(0.7),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
